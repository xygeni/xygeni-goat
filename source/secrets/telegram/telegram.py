import requests
import telegram

def bot_private_sendtext(bot_message):

	bot_token = '0123456789:AAHH8VJvQnKHKZjbZ8935HdA456gf2CUALo'
	bot_chatID = '0123456789'
	send_text = 'https://api.telegram.org/bot' + bot_token + '/sendMessage?chat_id=' + bot_chatID + '&parse_mode=Markdown&text=' + bot_message

	requests.get(send_text)
