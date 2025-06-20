function fn() {
  var env = karate.env || 'local';

  var config = {
    baseUrl: 'http://localhost:8080',
    port_marvel_characters_api: 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
  };

  // Puedes añadir aquí configuraciones específicas por entorno si las necesitas
  if (env === 'dev') {
    config.port_marvel_characters_api = 'https://api-dev.marvel.com';
  }

  return config;
}
