import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0


Popup {
    id: popup
    closePolicy: Popup.NoAutoClose
    bottomMargin: isLandscape? 24 : 80
    x: (root.width - width) / 2
    y: (root.height - height)
    background: Rectangle{
        color: "grey"
        radius: 24
        opacity: 0.8
    }
    Timer {
        id: toastTimer
        interval: 3000
        repeat: false
        onTriggered: {
            popup.close()
        }
    }
    Label {
        id: toastLabel
        leftPadding: 16
        rightPadding: 16
        font.pixelSize: 16
        color: "white"
    }
    onAboutToShow: {
        toastTimer.start()
    }
    function start(toastText, delay) {
        toastTimer.interval= delay
        toastLabel.text = toastText
        if(!toastTimer.running) {
            open()
        } else {
            toastTimer.restart()
        }
    }
}
