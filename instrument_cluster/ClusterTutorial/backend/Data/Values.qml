/****************************************************************************
**
** Copyright (C) 2018 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Design Studio.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

pragma Singleton
import QtQuick 2.10
import "simulation.js" as JS
// import qt.io.qmlcomponents 42.0

QtObject {
    id: values

    /* tachometer dial values */
    property int rpm // controls the needle / arc position
    property string displayRpm: "0"

    /* speedometer dial values */
    property real kph /* controls the needle / arc position */
    property string displayKph: "0"
    property string displayKpl: "100"

    /* fuel gauge dial values */
    property int liters /* controls the needle / arc position */
    property string displayLiters: "110"
    property string displayRange: "1100"

    /* current gear */
    property int currentGear: 1

    /* Iso Icons Boolean Values */
    property bool engineTemp
    property bool fuelLevel

    /* State change bool */
    property bool booting: true
    readonly property real bootDuration: 5000

    property Timer bootTimer: Timer{
        running: true
        repeat: false
        onTriggered: values.booting = false
        interval: bootDuration
    }

    property Timer rpmTimer: Timer{
        running: !values.booting
        repeat: true
        onTriggered: JS.rpmTimer()
        interval: 5
    }

    property Timer kphTimer: Timer{
        running: !values.booting
        repeat: true
        onTriggered: JS.kphTimer()
        interval: 10
    }

    property Timer litersTimer: Timer{
        running: !values.booting
        //running: true
        repeat: true
        onTriggered: JS.litersTimer()
        interval: 100
    }

}





/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
