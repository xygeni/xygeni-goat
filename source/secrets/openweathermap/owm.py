import pyowm

owm =  pyowm.OWM('0522639eb5e28d6595fc5ac1ce46b4ca')

place = input("В каком городе/стране?: ")
mgr = owm.weather_manager()
observation = mgr.weather_at_place('London,GB')
#observation = mgr.weather_manager().weather_at_place(place)
w = observation.get_weather()

print("В городе " + place + " сейчас " +
w.get_detailed_status())
temp = w.get_temperature('celsius')['temp']
print('Температура в районе: ' + str(temp) + '°C')

"""
import pyowm

owm = pyowm.OWM('', Language = "ru")

place = input("В каком городе искать ?")

observation = owm.weather_at_place('London,GB')
w = observation.get_weather()

print(w)
"""