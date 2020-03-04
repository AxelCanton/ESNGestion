# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_02_171726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "type"
    t.string "adresseC"
    t.string "numTelC"
    t.string "mailC"
    t.string "nomP"
    t.string "prenomP"
    t.string "nomEntreprise"
    t.string "numSiret"
    t.string "nomReferent"
  end

  create_table "contrat_clients", force: :cascade do |t|
    t.string "nomLogiciel"
    t.bigint "client_id"
    t.decimal "prixContrat"
    t.bigint "type_service_id"
    t.index ["client_id"], name: "index_contrat_clients_on_client_id"
    t.index ["type_service_id"], name: "index_contrat_clients_on_type_service_id"
  end

  create_table "employes", force: :cascade do |t|
    t.string "nomE"
    t.string "prenomE"
    t.string "mailE"
    t.decimal "ageE"
    t.string "adresseE"
    t.string "numTelE"
    t.string "formation"
    t.datetime "dateDebutE"
    t.datetime "dateFinE"
    t.decimal "nbAnneeExp"
    t.string "intituleContrat"
    t.decimal "salaireBrut"
    t.string "mdp"
    t.boolean "estAdmin"
    t.boolean "estValide"
  end

  create_table "employes_equipes", id: false, force: :cascade do |t|
    t.bigint "equipe_id"
    t.bigint "employe_id"
    t.index ["employe_id"], name: "index_employes_equipes_on_employe_id"
    t.index ["equipe_id"], name: "index_employes_equipes_on_equipe_id"
  end

  create_table "equipes", force: :cascade do |t|
    t.bigint "employe_id"
    t.string "nomEquipe"
    t.index ["employe_id"], name: "index_equipes_on_employe_id"
  end

  create_table "missions", force: :cascade do |t|
    t.string "adresseM"
  end

  create_table "participes", force: :cascade do |t|
    t.datetime "dateDebut"
    t.datetime "dateFin"
    t.boolean "participationEmployeTerminee"
    t.string "role"
    t.bigint "employe_id"
    t.bigint "contrat_client_id"
    t.bigint "missions_id"
    t.index ["contrat_client_id"], name: "index_participes_on_contrat_client_id"
    t.index ["employe_id"], name: "index_participes_on_employe_id"
    t.index ["missions_id"], name: "index_participes_on_missions_id"
  end

  create_table "travaillerSurs", force: :cascade do |t|
    t.bigint "equipe_id"
    t.bigint "contrat_client_id"
    t.boolean "participationTerminee"
    t.index ["contrat_client_id"], name: "index_travaillerSurs_on_contrat_client_id"
    t.index ["equipe_id"], name: "index_travaillerSurs_on_equipe_id"
  end

  create_table "type_services", force: :cascade do |t|
    t.string "libelleType"
  end

end
