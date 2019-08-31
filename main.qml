import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1640
    height: 1480
    title: qsTr("Sphere tag cloud")

    ListModel {
        id: tagsModel
        ListElement { name: "alignas" }
        ListElement { name: "enum" }
        ListElement { name: "return" }
        ListElement { name: "alignof" }
        ListElement { name: "explicit" }
        ListElement { name: "short" }
        ListElement { name: "and" }
        ListElement { name: "export" }
        ListElement { name: "signed" }
        ListElement { name: "and_eq" }
        ListElement { name: "extern" }
        ListElement { name: "sizeof" }
        ListElement { name: "asm" }
        ListElement { name: "false" }
        ListElement { name: "static" }
        ListElement { name: "auto" }
        ListElement { name: "float" }
        ListElement { name: "static_assert" }
        ListElement { name: "bitand" }
        ListElement { name: "for" }
        ListElement { name: "static_cast" }
        ListElement { name: "bitor" }
        ListElement { name: "friend" }
        ListElement { name: "struct" }
        ListElement { name: "bool" }
        ListElement { name: "goto" }
        ListElement { name: "switch" }
        ListElement { name: "break" }
        ListElement { name: "if" }
        ListElement { name: "template" }
    }

    SphereTagCloud {
        anchors.fill: parent
        radius: parent.height/3
        model: tagsModel
    }
}
