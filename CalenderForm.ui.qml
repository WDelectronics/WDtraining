import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

Calendar {
    id: calendar
    dayOfWeekFormat: 1
    visibleMonth: 0
    frameVisible: true
    weekNumbersVisible: true
    selectedDate: new Date(2014, 0, 1)
    focus: true

//    style: CalendarStyle {
//        dayDelegate: Item {
//            readonly property color sameMonthDateTextColor: "#444"
//            readonly property color selectedDateColor: Qt.platform.os === "osx" ? "#3778d0" : systemPalette.highlight
//            readonly property color selectedDateTextColor: "white"
//            readonly property color differentMonthDateTextColor: "#bbb"
//            readonly property color invalidDatecolor: "#dddddd"

//            Rectangle {
//                anchors.fill: parent
//                border.color: "transparent"
//                color: styleData.date !== undefined && styleData.selected ? selectedDateColor : "transparent"
//                anchors.margins: styleData.selected ? -1 : 0
//            }




//            }
//        }
  }


