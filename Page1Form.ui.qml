import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id: item1
    property alias textField1: textField1
    property alias button1: button1
    property alias mouseAreaRect1: mouseAreaRect1
    property alias rectangle1: rectangle1

    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        anchors.top: parent.top

        TextField {
            id: textField1
            placeholderText: "599fe6555775564b735dd363"
            text: "599fe6555775564b735dd363"
        }

        Button {
            id: button1
            text: qsTr("Press Me")
            Layout.alignment: Qt.AlignHCenter
        }
        Image {
            id: image1
            width: 100
            height: 100
            source: "/images/IMG_00000005.jpg"
            fillMode: Image.PreserveAspectCrop
            Layout.preferredWidth: 100
            Layout.preferredHeight: 100
        }

        Rectangle {
            id: rectangle1
            width: 200
            height: 85
            color: "#ff0000"
            MouseArea{
                id: mouseAreaRect1
                anchors.fill: parent
            }
        }

    }




}
