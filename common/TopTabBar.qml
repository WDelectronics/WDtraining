import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Material 2.0

ToolBar {
    id: titleToolBar
    property alias text: titleLabel.text
    RowLayout {
        id: topRow
        focus: false
        spacing: 6
        anchors.fill: parent
        Label {
            id: titleLabel
            text: "WD Training"
            leftPadding: 16
            Layout.fillWidth: true
            elide: Label.ElideRight
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            color: "white"
        }
        ToolButton {
            focusPolicy: Qt.NoFocus
            Image {
                id: buttonImage
                anchors.centerIn: parent
            }

        }
    }

    TabBar {
            id: myTabBar
            // we cannot customize the selectionBar, it's always accentColor
            // so we ov erwrite the accent
            Material.accent: Material.DeepOrange
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
                            //opacity: index == navPane.currentIndex? toolBarActiveOpacity : toolBarInactiveOpacity
                            text: modelData.name
                        }
                    } // content item
                    text: modelData.name
                    width: tabBarIsFixed? myTabBar.width / tabButtonModel.length  : Math.max(112, myTabBar.width / tabButtonModel.length)
                }
            }

        }




}
