# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define() do

  create_table "background_services", :force => true do |t|
    t.column "request_id", :integer, :default => 0, :null => false
    t.column "service_id", :integer, :default => 0, :null => false
  end

  add_index "background_services", ["request_id", "service_id"], :name => "bkgrd_svc_req"

  create_table "catalogs", :force => true do |t|
    t.column "service_id", :integer, :default => 0, :null => false
    t.column "url", :text, :default => "", :null => false
    t.column "opac_records", :boolean, :default => 0, :null => false
    t.column "consortial_catalog", :boolean, :default => 0, :null => false
    t.column "consortial_code", :string, :limit => 20
    t.column "opac_url", :text
  end

  add_index "catalogs", ["service_id"], :name => "cat_service_id"

  create_table "categories", :force => true do |t|
    t.column "category", :string, :limit => 100, :default => "", :null => false
    t.column "subcategory", :string, :limit => 100
  end

  add_index "categories", ["subcategory"], :name => "subcat_idx"

  create_table "categories_journals", :id => false, :force => true do |t|
    t.column "journal_id", :integer, :default => 0, :null => false
    t.column "category_id", :integer, :default => 0, :null => false
  end

  add_index "categories_journals", ["journal_id", "category_id"], :name => "journ_cat_idx"

  create_table "clickthroughs", :force => true do |t|
    t.column "request_id", :integer, :default => 0, :null => false
    t.column "service_response_id", :integer, :default => 0, :null => false
    t.column "created_at", :datetime, :null => false
  end

  add_index "clickthroughs", ["request_id"], :name => "click_req_id"
  add_index "clickthroughs", ["service_response_id"], :name => "click_serv_resp_idx"
  add_index "clickthroughs", ["created_at"], :name => "click_created_idx"

  create_table "coverages", :force => true do |t|
    t.column "journal_id", :integer, :default => 0, :null => false
    t.column "provider", :string, :default => "", :null => false
    t.column "coverage", :text
  end

  add_index "coverages", ["journal_id"], :name => "cvg_jrnl_id_idx"

  create_table "dispatched_services", :force => true do |t|
    t.column "request_id", :integer, :default => 0, :null => false
    t.column "service_id", :integer, :default => 0, :null => false
    t.column "successful", :boolean, :default => 0, :null => false
    t.column "updated_at", :datetime, :null => false
  end

  add_index "dispatched_services", ["request_id", "service_id"], :name => "dptch_request_id"

  create_table "institutions", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
    t.column "default_institution", :boolean, :default => 0, :null => false
    t.column "postal_code", :string, :limit => 10
    t.column "worldcat_registry_id", :string, :limit => 25
    t.column "oclc_symbol", :string, :limit => 10
  end

  add_index "institutions", ["name"], :name => "inst_name"
  add_index "institutions", ["default_institution"], :name => "inst_dflt_idx"

  create_table "institutions_services", :id => false, :force => true do |t|
    t.column "institution_id", :integer, :default => 0, :null => false
    t.column "service_id", :integer, :default => 0, :null => false
    t.column "dispatch_priority", :string, :limit => 2, :default => "", :null => false
  end

  add_index "institutions_services", ["institution_id", "service_id", "dispatch_priority"], :name => "inst_svc_pri_idx"

  create_table "institutions_users", :force => true do |t|
    t.column "institution_id", :integer, :default => 0, :null => false
    t.column "user_id", :integer, :default => 0, :null => false
    t.column "priority", :integer, :default => 0, :null => false
  end

  add_index "institutions_users", ["institution_id", "user_id", "priority"], :name => "instuserpri_id"

  create_table "irrelevant_sites", :force => true do |t|
    t.column "hostname", :string, :default => "", :null => false
  end

  add_index "irrelevant_sites", ["hostname"], :name => "irrev_hostname"

  create_table "journal_titles", :force => true do |t|
    t.column "title", :string, :default => "", :null => false
    t.column "journal_id", :integer, :default => 0, :null => false
  end

  add_index "journal_titles", ["title", "journal_id"], :name => "jtitle_title_objects"

  create_table "journals", :force => true do |t|
    t.column "object_id", :string, :limit => 20, :default => "", :null => false
    t.column "title", :string, :default => "", :null => false
    t.column "normalized_title", :string, :default => "", :null => false
    t.column "page", :string, :limit => 1, :default => "", :null => false
    t.column "issn", :string, :limit => 10
    t.column "eissn", :string, :limit => 10
    t.column "title_source_id", :integer, :default => 0, :null => false
  end

  add_index "journals", ["object_id"], :name => "j_object_id"
  add_index "journals", ["normalized_title", "page"], :name => "jrnl_norm_title"
  add_index "journals", ["title_source_id"], :name => "jrnl_title_source_id"
  add_index "journals", ["title"], :name => "jrnl_title_idx"
  add_index "journals", ["issn", "eissn"], :name => "jrnl_issn_idx"

  create_table "keywords", :force => true do |t|
    t.column "term", :string, :default => "", :null => false
    t.column "keyword_type", :string, :default => "", :null => false
  end

  add_index "keywords", ["term", "keyword_type"], :name => "kwd_term_idx"

  create_table "permalinks", :force => true do |t|
    t.column "referent_id", :integer, :default => 0, :null => false
  end

  add_index "permalinks", ["referent_id"], :name => "prm_referent_idx"

  create_table "referent_values", :force => true do |t|
    t.column "referent_id", :integer, :default => 0, :null => false
    t.column "key_name", :string, :limit => 50, :default => "", :null => false
    t.column "value", :text, :default => ""
    t.column "normalized_value", :string
    t.column "metadata", :boolean, :default => 0, :null => false
    t.column "private_data", :boolean, :default => 0, :null => false
  end

  add_index "referent_values", ["referent_id", "key_name", "normalized_value"], :name => "rft_val_referent_idx"

  create_table "referents", :force => true do |t|
    t.column "atitle", :string, :limit => 255
    t.column "title", :string, :limit => 255
    t.column "issn", :string, :limit => 10
    t.column "isbn", :string, :limit => 13    
    t.column "year", :string, :limit => 4
    t.column "volume", :string, :limit => 10    
  end
  
  add_index "referents", ["atitle", "title", "issn", "isbn", "year", "volume"], :name => 'rft_shortcut_idx'
  
  create_table "referrers", :force => true do |t|
    t.column "identifier", :string, :default => "", :null => false
  end

  add_index "referrers", ["identifier"], :name => "rfr_id_idx"

  create_table "relevant_sites", :force => true do |t|
    t.column "hostname", :string, :default => "", :null => false
    t.column "type", :string, :limit => 25
  end

  add_index "relevant_sites", ["hostname"], :name => "rel_hostname"

  create_table "requests", :force => true do |t|
    t.column "session_id", :string, :limit => 100, :default => "", :null => false
    t.column "referent_id", :integer, :default => 0, :null => false
    t.column "referrer_id", :integer
    t.column "created_at", :datetime, :null => false
  end

  add_index "requests", ["referent_id", "referrer_id"], :name => "context_object_idx"
  add_index "requests", ["session_id"], :name => "req_sess_idx"
  add_index "requests", ["created_at"], :name => "req_created_at"

  create_table "service_responses", :force => true do |t|
    t.column "service_id", :integer, :default => 0, :null => false
    t.column "key", :string, :limit => 100, :default => "", :null => false
    t.column "value_string", :string, :limit => 255
    t.column "value_alt_string", :text, :limit => 255
    t.column "value_text", :text
  end

  add_index "service_responses", ["service_id", "key", "value_string", "value_alt_string"], :name => "svc_resp_service_id"

  create_table "service_types", :force => true do |t|
    t.column "request_id", :integer, :default => 0, :null => false
    t.column "service_reponse_id", :integer, :default => 0, :null => false
    t.column "service_type", :string, :limit => 35, :default => "", :null => false
  end

  add_index "service_types", ["request_id", "service_reponse_id", "service_type"], :name => "svc_type_idx"

  create_table "services", :force => true do |t|
    t.column "name", :string, :limit => 100, :default => "", :null => false
    t.column "type", :string, :limit => 100, :default => "", :null => false
    t.column "url", :string, :default => "", :null => true
    t.column "username", :string, :limit => 100, :default => "", :null => true
    t.column "password", :string, :limit => 100, :default => "", :null => true
  end

  add_index "services", ["type"], :name => "service_type_idx"

  create_table "sessions", :force => true do |t|
    t.column "sessid", :string, :limit => 32
    t.column "data", :text
  end

  add_index "sessions", ["sessid"], :name => "sess_sessid_idx"

  create_table "title_sources", :force => true do |t|
    t.column "name", :string, :limit => 50, :default => "", :null => false
    t.column "location", :text, :default => "", :null => false
    t.column "filename", :text, :default => "", :null => false
  end

  create_table "users", :force => true do |t|
    t.column "username", :string, :limit => 50, :default => "", :null => false
    t.column "firstname", :string, :limit => 100
    t.column "lastname", :string, :limit => 100
    t.column "email", :string
  end

  add_index "users", ["username"], :name => "user_username_idx"

  create_table "permalinks", :force => true do |t|
     t.column "referent_id", :integer, :default => 0, :null => false
     t.column "created_on", :date, :default => '0000-00-00', :null => false
  end
  
  add_index "permalinks", ["referent_id"], :name => "plink_referent_idx"
 

end
