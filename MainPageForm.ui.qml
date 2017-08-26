import QtQuick 2.4
import QtQuick.Controls 2.2
import QtMultimedia 5.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

Item {
    width: 480
    height: 800

    property alias buttonGetSensor: buttonGetSensor
    property alias mouseAreaRectangleGetAllSensor: mouseAreaRectangleGetAllSensor
    property alias rectangleGetAllSensor: rectangleGetAllSensor
    property alias comboBoxSensorId: comboBoxSensorId
    property alias textAreaSensorInfo: textAreaSensorInfo

    property var sensorNameList : []
    property var sensorIdList: []

    Flickable {
        id: flickableMain
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent
        contentHeight: 1200

        ColumnLayout {
            anchors.fill: parent

            Label{
                id: labelTitle
                text: "SUT IoT Maker 2017!"
                font.bold: true
                font.pixelSize: 32
                Layout.alignment: Qt.AlignHCenter
            }

            Rectangle {
                id: rectangleGetAllSensor
                width: Screen.width * 0.8
                height: 200
                Layout.preferredWidth: width
                Layout.alignment: Qt.AlignHCenter
                anchors.top: labelTitle.bottom
                anchors.topMargin: 20
                color: "#aed581"
                ComboBox {
                    id: comboBoxSensorId
                    anchors.left: parent.left
                    anchors.leftMargin: 40
                    anchors.right: parent.right
                    anchors.rightMargin: 40
                    anchors.top: parent.top
                    anchors.topMargin: 20
                }

                Text {
                    text: "Get All Sensor Id"
                    anchors.top: comboBoxSensorId.bottom
                    anchors.topMargin: (parent.height - comboBoxSensorId.height)/2
                    anchors.horizontalCenter: parent.horizontalCenter
                    MouseArea{
                        id: mouseAreaRectangleGetAllSensor
                        anchors.fill: parent
                    }
                }
            }

            Rectangle{
                id: rectangleGetSensorInfo
                color: "#7da453"
                width: Screen.width * 0.8
                height: 360
                Layout.preferredWidth: width
                anchors.top: rectangleGetAllSensor.bottom
                anchors.topMargin: 20
                Layout.alignment: Qt.AlignHCenter
                TextArea{
                    id: textAreaSensorInfo
                    wrapMode: TextEdit.WrapAnywhere
                    anchors{
                        top: parent.top
                        topMargin: 20
                        bottom: buttonGetSensor.top
                        bottomMargin: 20
                        left: parent.left
                        leftMargin: 10
                        right: parent.right
                        rightMargin: 10
                    }
                    color: "white"
                }

                Button {
                    id: buttonGetSensor
                    text: qsTr("Get Sensor Info")
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                }

            }

        }

    }


}
