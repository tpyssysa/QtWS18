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

import QtQuick 2.10
import QtQuick.Shapes 1.0

Shape {
    id: root
    width: 200
    height: 150

    property int radius: 10

    property int topLeftRadius: radius
    property int bottomLeftRadius: radius
    property int topRightRadius: radius
    property int bottomRightRadius: radius

    //property alias gradient: path.fillGradient

    property alias strokeStyle: path.strokeStyle
    property alias strokeWidth: path.strokeWidth
    property alias strokeColor: path.strokeColor
    property alias dashPattern: path.dashPattern
    property alias joinStyle: path.joinStyle

    //property alias fillColor: path.fillColor

    property bool drawTop: true
    property bool drawBottom: true
    property bool drawRight: true
    property bool drawLeft: true

    Item {
        anchors.fill: parent
        anchors.margins: -root.strokeWidth / 2
    }

    ShapePath {
        id: path
        joinStyle: ShapePath.MiterJoin

        strokeWidth: 4
        strokeColor: "red"
        fillColor: "transparent"

        startX: root.topLeftRadius
        startY: 0


    }


    Item {
        id: shapes

        PathLine {
            x: root.width - root.topRightRadius
            y: 0
            property bool add: root.drawTop
        }

        PathArc {
            x: root.width
            y: root.topRightRadius
            radiusX: root.topRightRadius
            radiusY: root.topRightRadius
            property bool add: root.drawTop && root.drawRight
        }

        PathMove {
            x: root.width
            y: root.topRightRadius
            property bool add: !root.drawTop
        }


        PathLine {
            x: root.width
            y: root.height-root.bottomRightRadius
            property bool add: root.drawRight
        }

        PathArc {
            x: root.width-root.bottomRightRadius
            y: root.height
            radiusX: root.bottomRightRadius
            radiusY: root.bottomRightRadius
            property bool add: root.drawRight && root.drawBottom
        }

        PathMove {
            x: root.width-root.bottomRightRadius
            y: root.height
            property bool add: !root.drawRight
        }

        PathLine {
            x: root.bottomLeftRadius
            y: root.height
            property bool add: root.drawBottom
        }

        PathArc {
            x: 0
            y: root.height-root.bottomLeftRadius
            radiusX: root.bottomLeftRadius
            radiusY: root.bottomLeftRadius
            property bool add: root.drawBottom && root.drawLeft
        }

        PathMove {
            x: 0
            y: root.height-root.bottomLeftRadius
            property bool add: !root.drawBottom
        }

        PathLine {
            x: 0
            y: root.topLeftRadius
            property bool add: root.drawLeft
        }

        PathArc {
            x: root.topLeftRadius
            y: 0
            radiusX: root.topLeftRadius
            radiusY: root.topLeftRadius
            property bool add: root.drawTop && root.drawLeft
        }
    }

    //onDrawBottomChanged: invalidatePaths()
    //onDrawTopChanged: invalidatePaths()
    //onDrawLeftChanged: invalidatePaths()
    //onDrawRightChanged: invalidatePaths()

    function invalidatePaths() {
        if (!root.__completed)
            return

        for (var i = 0; i < shapes.resources.length; i++) {
            var s = shapes.resources[i];
            if (s.add)
                path.pathElements.push(s)
        }

    }

    property bool __completed: false

    Component.onCompleted: {
        root.__completed = true
        invalidatePaths()
    }
}
