import QtQuick 2.4

MainPageForm {

    signal sensorRecieved(string sensors);
    signal sensorInfoReceived(string sensor_info);

    onSensorRecieved: {
        console.log("Sensor recieved -> " + sensors);
        // convert JSON string to object and
        var object = JSON.parse(sensors);
        console.log("# of sensors -> " + object.length);

        // clear array
        sensorNameList = [];
        sensorIdList = [];

        // push new value of each sensor to array
        for(var i=0;i < object.length; i++)
        {
            sensorNameList.push(object[i].sensor_name);
            sensorIdList.push(object[i].sensor_id);
        }
        console.log("sensor_name list -> " + sensorNameList);
        console.log("sensor_name list -> " + sensorIdList);

        // set combobox list to sensorNameList
        comboBoxSensorId.model = sensorNameList;
    }

    onSensorInfoReceived: {
        console.log("sensor info -> " + sensor_info);
        var info = JSON.parse(sensor_info);

        // display info with TextArea
        textAreaSensorInfo.text = "Name: " + info.sensor_name
        textAreaSensorInfo.append("ID: " + info.sensor_id)
        textAreaSensorInfo.append("Value: " + info.value)
        textAreaSensorInfo.append("Status: " + info.status)
        var d = new Date(info.Created_date);
        textAreaSensorInfo.append("Created Date: " + d.toDateString());
        textAreaSensorInfo.append("Created Time: " + d.toTimeString());
    }

    comboBoxSensorId.onCurrentIndexChanged: {

    }

    buttonGetSensor.onClicked: {
        // get sensor according to selecting Id from ComboBox
        // this can also be done using event comboBoxSensorId.onCurrentIndexChanged above
        console.log("sensor info of " + sensorIdList[comboBoxSensorId.currentIndex]);
        getSensor(sensorIdList[comboBoxSensorId.currentIndex]);
    }

    mouseAreaRectangleGetAllSensor.onClicked: {
        getAllSensor();
    }

    function getAllSensor()
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
                    console.log("getAllSensor response -> " + xhr.responseText);
                    sensorRecieved(xhr.responseText);
                    return xhr.responseText;
                }
        }
        xhr.open("GET", "http://192.168.0.21:3000/sensor/");
        xhr.send();
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
                    console.log("getSensorInfo response -> " + xhr.responseText);
                    sensorInfoReceived(xhr.responseText);
                    return xhr.responseText;
                }
        }
        xhr.open("GET", "http://192.168.0.21:3000/sensor/"+sensorId);
        xhr.send();
    }
}
