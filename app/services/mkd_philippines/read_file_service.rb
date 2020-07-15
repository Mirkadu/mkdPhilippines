module MkdPhilippines
  class ReadFileService
    def initialize
      creek = Creek::Book.new Rails.root.join("app", "assets", "xlsx_file", "PSGC Publication Dec2019.xlsx")
      @sheet = creek.sheets[0]
      @philippines = MkdPhilippines::Philippine.create! code: 1, name: 'Philippines', geographic_level: 'Nat'
      @national_id = @philippines.code
    end

    def read_and_store
      @sheet.rows.each do |items|
        if items[items.keys.third].eql? 'Reg'
          region = MkdPhilippines::Region.create! parent_id: @national_id, code: items[items.keys.first], name: items[items.keys.second], geographic_level: items[items.keys.third], city_class: items[items.keys.fourth], income_classification: items[items.keys.fifth], rural_urban: items[items.keys.last]
          @region_id = region.code
        elsif items[items.keys.third].eql? 'Prov'
          province = MkdPhilippines::Province.create! parent_id: @region_id, code: items[items.keys.first], name: items[items.keys.second], geographic_level: items[items.keys.third], city_class: items[items.keys.fourth], income_classification: items[items.keys.fifth], rural_urban: items[items.keys.last]
          @province_id = province.code
        elsif items[items.keys.third].eql? 'City'
          city = MkdPhilippines::City.create! parent_id: @province_id, code: items[items.keys.first], name: items[items.keys.second], geographic_level: items[items.keys.third], city_class: items[items.keys.fourth], income_classification: items[items.keys.fifth], rural_urban: items[items.keys.last]
          @parent_id = city.code
        elsif items[items.keys.third].eql? 'Mun'
          municipality = MkdPhilippines::Municipality.create! parent_id: @province_id, code: items[items.keys.first], name: items[items.keys.second], geographic_level: items[items.keys.third], city_class: items[items.keys.fourth], income_classification: items[items.keys.fifth], rural_urban: items[items.keys.last]
          @parent_id = municipality.code
        elsif items[items.keys.third].eql? 'Bgy'
          MkdPhilippines::Barangay.create! parent_id: @parent_id, code: items[items.keys.first], name: items[items.keys.second], geographic_level: items[items.keys.third], city_class: items[items.keys.fourth], income_classification: items[items.keys.fifth], rural_urban: items[items.keys.last]
        end
      end

      return 'Success'
    end
  end
end
