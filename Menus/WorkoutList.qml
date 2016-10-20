import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0

import "../Dialogs"

SwipeView {
    id: swipeViewWorkout

    AddWorkoutDialog{
        id: dialogWorkout
        visible: false
    }

}
