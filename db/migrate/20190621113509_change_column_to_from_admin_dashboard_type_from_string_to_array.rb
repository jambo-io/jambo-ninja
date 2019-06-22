class ChangeColumnToFromAdminDashboardTypeFromStringToArray < ActiveRecord::Migration[5.0]
  def change
    execute <<-SQL
      ALTER TABLE "admin_mailer_managers" ALTER COLUMN "to" TYPE varchar[] USING string_to_array("admin_mailer_managers"."to", ',')::varchar[];
    SQL
  end
end
