# Tarea Nnodes - Ruleta Clima

Se debe realizar una simulación, la cual consiste en un grupo dinámico de personas jugando a la
ruleta. El objetivo es crear un sistema para monitorear una mesa de casino, donde los jugadores
modifican sus apuestas dependiendo del clima.

# Puesta en marcha

Para poder ejecutar el proyecto se debe correr la ultima version de ruby a la fecha (3.0.2) y la ultima version de rails a la fecha (6.1.4.1). 
Con ello luego solo se debe correr los siguientes comandos:

    $ bundle install
    $ bundle update
    $ rails db:create
    $ rails db:migrate
    $ rails s

Gemas Utilizadas |
------------- |
Nokogiri https://github.com/sparklemotion/nokogiri | 

# Utilizado

- Se utilizo la api de openweathermap para obtener el clima en el momento que se realizan las vueltas de la ruleta.
- Cron to go de Heroku para administrar los cron jobs que ejecutar el roll cada 3 min y a las 00 de cada dia añade 10.000 a cada jugador