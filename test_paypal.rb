class Test

def test_paypal
request = HTTParty.post("https://svcs.sandbox.paypal.com/AdaptivePayments/Pay.json",
headers: {"X-PAYPAL-SECURITY-USERID" => "maria.cassino-facilitator_api1.gmail.com",
"X-PAYPAL-SECURITY-PASSWORD" => "U9FL2MK962DKPXMR",
"X-PAYPAL-SECURITY-SIGNATURE" => "AFcWxV21C7fd0v3bYYYRCpSSRl31A2tjSJXfuAz3het2TLAiz2uCt1eN",
# "X-PAYPAL-REQUEST-DATA-FORMAT" => "JSON",
# "X-PAYPAL-RESPONSE-DATA-FORMAT"  "JSON",
"X-PAYPAL-APPLICATION-ID": "APP-80W284485P519543T"
},
data:   {actionType: "PAY",
currencyCode: "USD",
receiverList: {
receiver:[
{amount: "1.00",
email: "maria.cassino@gmail.com"}
]
},
returnUrl: "http://www.example.com/success.html",
cancelUrl: "http://www.example.com/failure.html",
requestEnvelope:{
errorLanguage: "en_US",
detailLevel: "ReturnAll" }
}
)
end


end
