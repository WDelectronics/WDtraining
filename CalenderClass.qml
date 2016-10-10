import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4


Pane{

    MouseArea{
        id: mouse
        anchors.fill: parent
        onClicked: console.log("Mouse: " )

        Calendar {
            id: calendarF
            anchors.fill: parent
            dayOfWeekFormat: 1
            visibleMonth: 0
            frameVisible: true
            weekNumbersVisible: true
            selectedDate: new Date(2016, 0, 1)
            focus: true

            style: CalendarStyle {
                dayDelegate: Item {
                    readonly property color sameMonthDateTextColor: "#444"
                    readonly property color selectedDateColor: Qt.platform.os === "osx" ? "#3778d0" : systemPalette.highlight
                    readonly property color selectedDateTextColor: "white"
                    readonly property color differentMonthDateTextColor: "#bbb"
                    readonly property color invalidDatecolor: "#dddddd"

                    Rectangle {
                        anchors.fill: parent
                        border.color: "transparent"
                        //color: styleData.date !== undefined && styleData.selected ? selectedDateColor : "transparent"
                        anchors.margins: styleData.selected ? -1 : 0
                    }

                    Label {
                        id: dayDelegateText
                        text: styleData.date.getDate()
                        anchors.centerIn: parent
                        color: {
                            var color = invalidDatecolor;
                            if (styleData.valid) {
                                // Date is within the valid range.
                                color = styleData.visibleMonth ? sameMonthDateTextColor : differentMonthDateTextColor;
                                if (styleData.selected) {
                                    color = selectedDateTextColor;
                                }
                            }
                            color;
                        }
                    }
                }
            }
            onClicked: console.log("Place: " )

        }

        PieMenu{
            id: pieMenu

            MenuItem {
                text: "1"
                onTriggered: print("Action 1")
            }
            MenuItem {
                text: "Action 2"
                onTriggered: print("Action 2")
            }
            MenuItem {
                text: "Action 3"
                onTriggered: print("Action 3")
            }
            MenuItem{
                text: "Action 4"
                onTriggered: print("Action 4")
            }
        }
    }
}





