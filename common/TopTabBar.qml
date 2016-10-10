import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0


ToolBar {
    property alias text: titleLabel.text
    property bool backToolButtonVisible: false
    property alias currentIndex: myTabBar.currentIndex
    // explains how to calculate the height:
    property int defaultToolBar: 48
    property int defaultTabBar: 48
    // without this selected tab not marked
    property int landscapeExtra: isLandscape? 1 : 0
    height: defaultToolBar + defaultTabBar + landscapeExtra
    RowLayout {
        id: topRow
        focus: false
        spacing: 6
        anchors.left: parent.left
        anchors.right: parent.right
        ToolButton {
            enabled: backToolButtonVisible
            focusPolicy: Qt.NoFocus
            Image {
                id: backImageImage
                visible: backToolButtonVisible
                anchors.centerIn: parent
                //source: "qrc:/images/"+iconOnPrimaryFolder+"/arrow_back.png"
            }
            onClicked: {
                navPane.onePageBack()
            }
        }
        Label {
            id: titleLabel
            text: "WD Training"
            font.pixelSize: 20
            Layout.fillWidth: true
            elide: Label.ElideRight
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }
        ToolButton {
            focusPolicy: Qt.NoFocus
            Image {
                id: buttonImage
                anchors.centerIn: parent
                source: "qrc:/icon/Resources/android/drawable-mdpi/ic_fitness_center_black_24dp.png"
            }
            onClicked: {
                optionsMenu.open()
            }
            Menu {
                id: optionsMenu
                x: parent.width - width
                transformOrigin: Menu.TopRight
                MenuItem {
                    text: "Login"
                    onTriggered: {

                    }
                }
                MenuItem {
                    text: qsTr("Chestday")
                    onTriggered: {

                    }
                }
                MenuItem {
                    text: qsTr("Chestday")
                    onTriggered: {

                    }
                }
                onAboutToHide: {
                    root.resetFocus()
                }
            }

        }
    }
    TabBar {
        id: myTabBar
        anchors.top: topRow.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        currentIndex: 0
        onCurrentIndexChanged: {
            swipeView.currentIndex = currentIndex
        }

        Repeater {
            model: tabButtonModel
            TabButton {
                focusPolicy: Qt.NoFocus
                height: 48
                contentItem:
                    Item {
                    Label {
                        Layout.fillWidth: true
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.capitalization: Font.AllUppercase
                        font.weight: Font.Medium
                        text: modelData.name
                    }
                }
                text: modelData.name
                width: tabBarIsFixed? myTabBar.width / tabButtonModel.length  : Math.max(112, myTabBar.width / tabButtonModel.length)
            }
        }

    }

}
