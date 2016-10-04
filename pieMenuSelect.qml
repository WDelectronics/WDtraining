import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4


PieMenu {
      id: pieMenu

      MenuItem {
          text: "Action 1"
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
  }
