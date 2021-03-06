require_relative('../db/sql_runner')

class Pet

    attr_accessor :id, :name, :type, :pet_store_id

    def initialize(options)
        # @id = options['id'].to_i if options['id'] != nil
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @type = options['type']
        @pet_store_id = options['pet_store_id'].to_i
    end

    def save
        sql = "INSERT INTO pets (name, type, pet_store_id) VALUES ('#{@name}', '#{@type}', '#{@pet_store_id}') RETURNING *"
        pet = SqlRunner.run(sql).first
        @id = pet['id'].to_i
    end
    #.to_i --> ? 
    
    def pet_store
        sql= "SELECT * FROM pet_stores WHERE id = #{@pet_store_id}"
        pet_store = SqlRunner.run(sql).first
        return PetStore.new( pet_store ) 
    end

    def self.all()
        sql = "SELECT * FROM pets;"
        pets = SqlRunner.run(sql)
        return pets.map {|pet| Pet.new(pet)}
    end

    def self.find(id)
        sql = "SELECT * FROM pets WHERE id = #{id}"
        pet = SqlRunner.run(sql)
        return Pet.new(pet.first())
    end

    def update
        sql = "UPDATE pets SET
        name = '#{@name}',
        type = '#{@type}',
        pet_store_id = '#{pet_store_id}'
        WHERE id = #{id} "
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM pets WHERE id = #{id}"
        SqlRunner.run(sql)
    end

end