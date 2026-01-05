import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 500
    height: 400
    visible: true
    title: "QML Hello World"
    
    // 배경 색상
    color: "#f5f5f5"
    
    ColumnLayout {
        anchors.centerIn: parent
        spacing: 30
        
        // 환영 메시지
        Rectangle {
            Layout.alignment: Qt.AlignHCenter
            width: 400
            height: 100
            color: "#4CAF50"
            radius: 10
            
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 5
                
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "QML로 만든 GCS"
                    font.pixelSize: 24
                    font.bold: true
                    color: "white"
                }
                
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "선언적 UI의 세계에 오신 것을 환영합니다!"
                    font.pixelSize: 14
                    color: "white"
                }
            }
        }
        
        // 상태 표시 레이블
        Text {
            id: statusLabel
            Layout.alignment: Qt.AlignHCenter
            text: "버튼을 클릭해보세요"
            font.pixelSize: 16
            color: "#333"
        }
        
        // 버튼
        Button {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 200
            Layout.preferredHeight: 50
            
            text: "클릭!"
            font.pixelSize: 16
            
            background: Rectangle {
                color: parent.pressed ? "#2196F3" : parent.hovered ? "#64B5F6" : "#42A5F5"
                radius: 5
            }
            
            contentItem: Text {
                text: parent.text
                font: parent.font
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            
            onClicked: {
                // Python 백엔드 호출
                statusLabel.text = backend.getGreeting()
            }
        }
        
        // 설명 텍스트
        Rectangle {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 400
            Layout.preferredHeight: 80
            color: "#E3F2FD"
            radius: 8
            border.color: "#2196F3"
            border.width: 1
            
            Text {
                anchors.centerIn: parent
                anchors.margins: 10
                width: parent.width - 20
                text: "이 예제는 QML과 Python이 어떻게 \n상호작용하는지 보여줍니다"
                font.pixelSize: 14
                color: "#1976D2"
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
            }
        }
    }
}
