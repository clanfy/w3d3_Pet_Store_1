require_relative('../db/sql_runner')

class PetStore

    attr_reader :id, :name, :address, :type

    def initialize (options)
        @id     = options['id'].to_i
        @name   = options['name']
        @address= options['address']
        @type   = options['type']
    end

    def save
        sql = "INSERT INTO pet_stores (name, address, type) VALUES ('#{@name}', '#{@address}', '#{@type}') RETURNING *"
        pet_store = SqlRunner.run(sql).first
        @id = pet_store['id']
    end

    def pets
        sql ="SELECT * FROM pets WHERE pet_store_id = #{@id};"
        pets = SqlRunner.run(sql)
        return pets.map {|pet| Pet.new(pet)}
    end

    def self.all()
        sql = "SELECT * FROM pet_stores;"
        pet_stores = SqlRunner.run(sql)
        return pet_stores.map { |store| PetStore.new(store) }
    end
    

end
