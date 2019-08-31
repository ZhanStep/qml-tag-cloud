import QtQuick 2.0

Item {
    id: root

    property ListModel model: value

    property var tags: []
    property var xyz: []
    property real radius

    property var w: root.width/15
    property var h: root.width/30

    function toOpacity(z) {
        return z/(4*root.radius)+0.75
    }

    function toScale(z) {
        return z/(2*root.radius) + 1
    }

    function rotate(n,a,b,c)
    {
        var x,y,z;

        x=xyz[n].x;
        y=xyz[n].y;
        z=xyz[n].z;

        var sa=Math.sin(a),
            ca=Math.cos(a),
            sb=Math.sin(b),
            cb=Math.cos(b),
            sc=Math.sin(c),
            cc=Math.cos(c);

        var ox=x,
            oy=y,
            oz=z;

        x = ox*cb*cc 		    - oy*cb*sc			  + oz*sb;
        y = ox*(cc*sa*sb+ca*sc) + oy*(ca*cc-sa*sb*sc) - oz*(cb*sa);
        z = ox*(sa*sc-ca*cc*sb) + oy*(cc*sa+ca*sb*sc) + oz*(ca*cb);

        tags[n].x = root.width/2 + x
        tags[n].y = root.height/2 + y
        tags[n].width = w*toScale(z)
        tags[n].height = h*toScale(z)
        tags[n].opacity = toOpacity(z)
    }

    anchors.fill: parent

    Component.onCompleted: {
        var x,y,z,f,t,c;
        var num = root.model.count
        var w = parent.width/15
        var h = parent.width/30

        var component = Qt.createComponent("qrc:/Tag.qml");

        for (var i=1; i<=num; i++) {
            var object = component.createObject(root);

            f = Math.acos(-1 + (2 * i - 1) / num);
            t = Math.sqrt(num * Math.PI) * f;

            x = Math.round(radius * Math.sin(f) * Math.cos(t));
            y = Math.round(radius * Math.sin(f) * Math.sin(t));
            z = Math.round(radius * Math.cos(f));

            xyz[i-1]={x:x,y:y,z:z};

            object.text = model.get(i-1).name
            object.x = root.width/2 + x
            object.y = root.height/2 + y
            object.width = w*toScale(z)
            object.height = h*toScale(z)
            object.opacity = toOpacity(z)

            tags.push(object)
        }
    }

    Timer {
        property real rotX: 0
        property real rotY: 0
        property real rotZ: 0
        interval: 10; running: true; repeat: true
        onTriggered: {
            rotY+=0.002
            for(var i=0; i<root.model.count; i++)
                root.rotate(i, rotX,rotY,rotZ)
        }
    }

}
