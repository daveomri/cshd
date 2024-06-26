class CreateInteractions < ActiveRecord::Migration[7.0]
  def change
    create_table :interactions do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
