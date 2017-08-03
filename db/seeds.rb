# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Création des privilèges
privileges = Array.new
privileges << {label: 'Utilisateur', level: 0}
privileges << {label: 'Administrateur', level: 100}
privileges << {label: 'Superadministrateur', level:1000}

#insertion
privileges.each do |p|
  Privilege.create({label: p[:label], level: p[:level]})
end

#Création des utilisateurs
User.create([{name: 'Thibault', surname: 'Brunet', mail: 'thibaultbrunet1@gmail.com', privilege_id: Privilege.find_by(label: 'Superadministrateur').id}])
User.create([{name: 'Dylan', surname:'Rey-Gaurez', mail:'dylan.reygaurez@gmail.com', privilege_id: Privilege.find_by(label: 'Utilisateur').id}])
User.create([{name: 'Alphonse', surname: 'Roy', mail:'a.roy@ciat.fr', privilege_id: Privilege.find_by(label: 'Administrateur').id}])
User.create([{name: 'Medric', surname: 'Chouan', mail:'medric.chouan@gmail.com', privilege_id: Privilege.find_by(label: 'Utilisateur').id}])

id = User.find_by(mail: 'dylan.reygaurez@gmail.com').id
group_name = 'Polytech group'

#Création des groupes et des relations de groupes
Group.create([{name: group_name, user_id: id }])
UserGroup.create([{user_id: id, group_id: Group.find_by(name: group_name).id}])

Notification.create([{message: 'test', action: 'aucune', user_id: id, viewed: false}])
Notification.create([{message: 'etete', action: 'aucune', user_id: id, viewed: false}])
