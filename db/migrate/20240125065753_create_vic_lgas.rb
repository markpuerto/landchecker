class CreateVicLgas < ActiveRecord::Migration[7.1]
  def change
    create_table :vic_lgas do |t|
      t.string :pfi
      t.string :lga_code
      t.string :lga_name
      t.string :gaz_lga
      t.string :gazregn
      t.string :abslgacode
      t.date :pfi_cr
      t.integer :ufi
      t.date :ufi_cr
      t.integer :ufi_old
      t.column :geom, :geometry
      t.timestamps
    end
  end
end
