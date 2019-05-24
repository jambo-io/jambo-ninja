class ApplicationController < ActionController::Base
  def default_url_options
    { locale: I18n.locale }
  end
  protect_from_forgery with: :exception
  #Prevent CSRF attacks by raising exception.
  #For APIs, you may want to use :null_session instead.
  before_action :quotes
  include SessionsHelper

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def quotes

    phrases = ["Bem-aventurado quem se associa a todos os homens em espírito de perfeita bondade e amor.",
               "Convivei com os seguidores de todas as religiões em espírito de amizade e camaradagem.",
               "O bem-estar da humanidade, sua paz e segurança, são irrealizáveis, a não ser que, primeiro, se estabeleça firmemente sua unidade.",
               "Acautelai-vos para não ferir nenhuma alma, nem trazer tristeza a nenhum coração;",
               "... hoje todos os horizontes do mundo estão iluminados com a luz da unidade...",
               "Em verdade, é homem aquele que se dedica ao serviço da humanidade inteira.",
               "Tal oportunidade é insubstituível... Trabalhar, perseverar é assegurar a vitória completa e final.",
               "O amor é a maior lei que governa este ciclo poderoso e celestial, o poder sem igual que liga os diversos elementos deste mundo material...",
               "Bahá'u'lláh delineou o círculo da unidade; Ele fez um plano para a união de todos os povos e para a união de todos sob a proteção da tenda da unidade universal."
                ]


      author = ["Bahá'u'lláh",
               "Bahá'u'lláh",
               "Bahá'u'lláh",
               "Abdu'l-Bahá",
               "Bahá'u'lláh",
               "Bahá'u'lláh",
               "Shoghi Effendi",
               "Abdu'l-Bahá",
               "Abdu'l-Bahá"
              ]

        random_number = rand(8)
        @quote = phrases[random_number]
        @author = author[random_number]

        random_number_image = rand(12) + 1
        random_number_image2 = rand(12) + 1
        @image = "bg" + random_number_image.to_s + ".jpg"
        @image2 = "bg" + random_number_image2.to_s + ".jpg"
  end



end
