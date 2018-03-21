class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |m|
      # title: "The Sting",
      # release_date: 1973,
      # director: "George Roy Hill",
      # lead: "Paul Newman",
      # in_theaters: false
      m.string :title
      m.integer :release_date
      m.string :director
      m.string :lead
      m.boolean :in_theaters
    end
  end
end
