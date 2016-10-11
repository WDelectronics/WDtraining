import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

SwipeView {
    id: swipeView
    anchors.fill: parent
    currentIndex: 0
    focus: true

    property bool tabBarIsFixed: false

    Loader {
            id: titleBar
            visible: true
            //active: !isLandscape
            source: "qrc:/common/TopTabBar.qml"
            onLoaded: {
                if(item) {
                    item.currentIndex = swipeView.currentIndex
                    item.text = qsTr("Gains O´Clock")
                }
            }
        }

    property var tabButtonModel: [{"name": "Login"},
                                 {"name": "Get Ready"},
                                 {"name": "Training"},
                                 {"name": "Lift O´Clock!"},
                                 {"name": "Progress"}]


        anchors.topMargin: isLandscape? 6 : 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        onCurrentIndexChanged: {
            titleBar.item.currentIndex = currentIndex
        }


        Loader{
            id:calender
            active: true
            source: "qrc:/CalenderClass.qml"

        }
    }
