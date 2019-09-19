(defproject vebprojekat "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [compojure "1.5.2"]
                 [selmer "1.10.7"]
                 [ring-server "0.4.0"]
                 [org.clojure/java.jdbc "0.6.1"]
                 [com.cerner/clara-rules "0.14.0"]
                 [buddy/buddy-auth "1.4.1"]
                 [bcrypt-clj "0.3.3"]
                 [mysql/mysql-connector-java "5.1.6"]
                 [liberator "0.10.0"]
                 [ring/ring-json "0.4.0"]
                 [migratus "0.8.28"]
                 [korma/korma "0.4.3"]
                 [funcool/struct "1.0.0"]]
  :require [config.core :refer [env]]  
  :jvm-opts ["-Dconf=dev-config.edn"]  
  :plugins [[lein-ring "0.8.12"]
            ]  
  
  :ring {:handler vebprojekat.core/app
         :init vebprojekat.core/init
         :destroy vebprojekat.core/destroy}  
  :profiles
  {:uberjar {:aot :all}
   :production
			  {:ring
			   {:open-browser? false, :stacktraces? false, :auto-reload? false}}
   :dev {:dependencies [[javax.servlet/servlet-api "2.5"]
                        [ring/ring-mock "0.3.2"]
                        [figwheel "0.2.5"]
												[com.cemerick/piggieback "0.2.0"]
												[org.clojure/tools.nrepl "0.2.10"]
												[weasel "0.6.0"]
                       ]}})
