module InteliData
  class DumpDataset
    def process
      file = File.read Rails.root.join('db', 'datasets', 'data.json')
      hash = JSON.parse file
      ActiveRecord::Base.transaction do
        begin
          hash['dataset'].each do |entry|
            data_entry = build_data_entry entry
            data_entry.save!
            populate_references data_entry, entry
          end
        rescue ActiveRecord::RecordInvalid => e
          puts e.message
          puts e.backtrace.join "\n"
          raise ActiveRecord::Rollback
        end
      end
    end

    private

    def build_data_entry(entry)
      data_entry = DataEntry.new

      data_entry.oid = entry['_id']['$oid']

      data_entry.data_entry_type = entry['@type']
      data_entry.access_level = entry['accessLevel']

      populate_contact_point data_entry, entry

      data_entry.description = entry['description']
      data_entry.identifier = entry['identifier']

      populate_keywords data_entry, entry

      data_entry.modified = DateTime.parse entry['modified']

      populate_publishers data_entry, entry

      data_entry.title = entry['title']

      populate_bureau_codes data_entry, entry
      populate_distributions data_entry, entry
      populate_languages data_entry, entry
      populate_program_codes data_entry, entry
      populate_themes data_entry, entry

      if entry.key? 'accrualPeriodicity'
        data_entry.accrual_periodicity = entry['accrualPeriodicity']
      end
      if entry.key? 'issued'
        data_entry.issued = DateTime.parse entry['issued']
      end
      if entry.key? 'landingPage'
        data_entry.landing_page = entry['landingPage']
      end
      if entry.key? 'temporal'
        temporal_times = entry['temporal'].split '/'
        data_entry.temporal_start = temporal_times[0]
        data_entry.temporal_end = temporal_times[1]
      end
      if entry.key? 'license'
        data_entry.license = entry['license']
      end
      if entry.key? 'isPartOf'
        data_entry.is_part_of = entry['isPartOf']
      end
      data_entry
    end

    def build_publisher(publisher_entry)
      publisher = Publisher.new
      publisher.name = publisher_entry['name']
      sub_organization_of = nil
      if publisher_entry.key? 'subOrganizationOf'
        sub_organization_of = build_publisher publisher_entry['subOrganizationOf']
        publisher.sub_organization_of = sub_organization_of
      end
      publisher.save!
      unless sub_organization_of.nil?
        sub_organization_of.parent_organization = publisher
        sub_organization_of.save!
      end
      publisher
    end

    def populate_bureau_codes(data_entry, entry)
      if entry.key? 'bureauCode'
        entry['bureauCode'].each do |bureau_code_entry|
          bureau_code = BureauCode.find_or_create_by! code: bureau_code_entry
          data_entry.bureau_codes << bureau_code
        end
      end
    end

    def populate_contact_point(data_entry, entry)
      contact_point_entry = entry['contactPoint']
      contact_point = ContactPoint.new
      if contact_point_entry.key? '@type'
        contact_point.contact_point_type = contact_point_entry['@type']
      end
      contact_point.fn = contact_point_entry['fn']
      contact_point.has_email = contact_point_entry['hasEmail']
      contact_point.save!
      data_entry.contact_point = contact_point
    end

    def populate_distributions(data_entry, entry)
      if entry.key? 'distribution'
        entry['distribution'].each do |distribution_entry|
          distribution = nil
          if distribution_entry.key? 'accessURL'
            distribution = Distribution.find_by access_url: distribution_entry['accessURL']
          elsif distribution_entry.key? 'downloadURL'
            distribution = Distribution.find_by download_url: distribution_entry['downloadURL']
          end
          if distribution.nil?
            distribution = Distribution.new
            if distribution_entry.key? '@type'
              distribution.distribution_type = distribution_entry['@type']
            end
            if distribution_entry.key? 'accessURL'
              distribution.access_url = distribution_entry['accessURL']
            end
            if distribution_entry.key? 'conformsTo'
              distribution.conforms_to = distribution_entry['conformsTo']
            end
            if distribution_entry.key? 'downloadURL'
              distribution.download_url = distribution_entry['downloadURL']
            end
            if distribution_entry.key? 'describedBy'
              distribution.described_by = distribution_entry['describedBy']
            end
            if distribution_entry.key? 'describedByType'
              distribution.described_by_type = distribution_entry['describedByType']
            end
            if distribution_entry.key? 'description'
              distribution.description = distribution_entry['description']
            end
            if distribution_entry.key? 'format'
              distribution.format = distribution_entry['format']
            end
            if distribution_entry.key? 'mediaType'
              distribution.media_type = distribution_entry['mediaType']
            end
            if distribution_entry.key? 'title'
              distribution.title = distribution_entry['title']
            end
          end
          data_entry.distributions << distribution
        end
      end
    end

    def populate_keywords(data_entry, entry)
      entry['keyword'].each do |keyword_entry|
        keyword = Keyword.find_or_create_by! keyword: keyword_entry
        data_entry.keywords << keyword
      end
    end

    def populate_languages(data_entry, entry)
      if entry.key? 'language'
        entry['language'].each do |language_entry|
          language = Language.find_or_create_by language: language_entry
          data_entry.languages << language
        end
      end
    end

    def populate_program_codes(data_entry, entry)
      if entry.key? 'programCode'
        entry['programCode'].each do |program_code_entry|
          program_code = ProgramCode.find_or_create_by! program_code: program_code_entry
          data_entry.program_codes << program_code
        end
      end
    end
    
    def populate_publishers(data_entry, entry)
      publisher = Publisher.find_by name: entry['publisher']['name']
      publisher = build_publisher entry['publisher'] unless publisher
      data_entry.publisher = publisher
    end

    def populate_references(data_entry, entry)
      if entry.key? 'reference'
        entry['reference'].each do |reference_entry|
          reference = Reference.new
          reference.reference = reference_entry
          reference.data_entry = data_entry
          reference.save!
        end
      end
    end

    def populate_themes(data_entry, entry)
      if entry.key? 'theme'
        entry['theme'].each do |theme_entry|
          theme = Theme.find_or_create_by! name: theme_entry
          data_entry.themes << theme
        end
      end
    end
  end
end
