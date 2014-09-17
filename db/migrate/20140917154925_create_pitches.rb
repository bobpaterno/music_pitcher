class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :pitch_to
      t.text :pitch_notes
      t.string :email
      t.string :subject
      t.text :message
      t.boolean :listened_to

      t.timestamps
    end
  end
end
