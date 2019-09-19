(ns vebprojekat.rute.login
  (:require [compojure.core :refer :all]
            [vebprojekat.models.baza :as db]
            [selmer.parser :refer [render-file]]
            [compojure.response :refer [render]]
            [selmer.parser :refer [render-file]]
            [liberator.core :refer [defresource]]
            [clojure.data.json :as json]
            [struct.core :as st]
            [clojure.java.io :as io]
            [liberator.representation :refer [ring-response as-response]]
            [clojure.set :refer [rename-keys]]
            [clojure.string :as str]
            [ring.util.response :refer [redirect]]))
(defn get-login-page [&[error]]
  (render-file "views/login.html" {:title "Logovanje"
                                   :error error}))

(defroutes home-routes
           (GET "/" [] (get-login-page))
           
        )
  

