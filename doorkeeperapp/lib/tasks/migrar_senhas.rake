# encoding: utf-8
namespace :app do
	desc "Essa bagaça esncripta senhas"
	task migrar_senhas: :environment do #Encripta todas as senhas que ainda não foram processadas no banco de dados
		unless User.attribute_names.include? "password"
			puts "Senhas migradas parceiro!"
			return
		end

		User.find_each do |user|
			puts "Migrando usuario ##{user.id} #{user.full_name}"
			unencripted_password = user.attributes["password"]

			user.password = unencripted_password
			user.password_confirmation = unencripted_password
			user.save!
		end
	end
end