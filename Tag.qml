import QtQuick 2.0

Item {
    property alias text: txt.text

//    FontLoader { id: mulFont; source: "qrc:/resources/fonts/Marske.ttf" }

    Text {
        id: txt
        anchors.centerIn: parent
        color: "black"
//        font.family: mulFont.name
        font.pixelSize: parent.height
    }
}
