class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :doctors, foreign_key: true
      t.belongs_to :patients, foreign_key: true

      t.timestamps
    end
  end
end
