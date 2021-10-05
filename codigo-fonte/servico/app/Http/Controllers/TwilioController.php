<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Twilio\Http\GuzzleClient;
use Twilio\TwiML\VoiceResponse;
use Twilio\Rest\Client;

class TwilioController extends Controller
{
    public function voice()
    {
        // Find your Account SID and Auth Token at twilio.com/console
// and set the environment variables. See http://twil.io/secure
        $sid = 'ACfb535593dd477de05645028d1ef47f53';
        $token = '2fe000b103cc06c7abac2fafd81946e1';
        $twilio = new Client($sid, $token);
        $twilio_number = "+13374920995";

//        $twilio->messages
//            ->create("+5561985127199", // to
//                [
//                    'from' => $twilio_number,
//                    "body" => "Te amo, minha vida testwe!"
//                ]
//            );


        $call = $twilio->calls
            ->create("+5561985127199", // to
                $twilio_number, // from
                [
                    "twiml" => "<Response><Say>I love you my girl! </Say></Response>"
                ]
            );

        echo "Iniciando ligação:" . $call->sid;
    }
}
