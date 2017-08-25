import QtQuick 2.7

Page1Form {
    signal sensorRecieved(string value);

    onSensorRecieved: {
        console.log("Sensor recieved -> " + value);

        button1.text = value;
    }

    button1.onClicked: {
        console.log("Button Pressed. Entered text: " + textField1.text);
        button1.text = textField1.text;
    }

    mouseAreaRect1.onClicked: {
        button1.text = textField1.text;
        getSensor(textField1.text);
    }

    function checkColor()
    {
        return rectangle1.color;
    }

    function getSensor(sensorId)
    {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function()
        {
            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED)
            {
                console.log("HEADERS_RECEIVED");
            }
            else
                if(xhr.readyState === XMLHttpRequest.DONE)
                {
                    console.log("getSensor response -> " + xhr.responseText);
                    var object = JSON.parse(xhr.responseText);
                    console.log("getSensor response -> " + object.sensorId);
                    sensorRecieved(object.value);
                    return xhr.responseText;
                }
        }
        xhr.open("GET", "http://172.31.168.194:3000/sensor/" + sensorId);
        //xhr.open("GET", "http://172.31.171.16:3000/getDiseaseType/" + imageId);

        xhr.send();
    }
}
