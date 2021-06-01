class CreateJobLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :job_leads do |t|
      t.string :from
      t.string :subject

      t.timestamps
    end
  end
end
