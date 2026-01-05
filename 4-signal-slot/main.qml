import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 950
    height: 800
    visible: true
    title: "Signal-Slot 메커니즘 학습"
    
    // Signal 수신을 위한 연결
    Connections {
        target: processor
        
        function onDataProcessed(result) {
            console.log("[QML] dataProcessed Signal 수신:", result)
            asyncResultLabel.text = result
            asyncResultLabel.color = "#4CAF50"
        }
    }
    
    ScrollView {
        anchors.fill: parent
        contentWidth: availableWidth
        
        ColumnLayout {
            width: parent.width
            spacing: 20
            
            // 제목
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60
                color: "#673AB7"
                
                Text {
                    anchors.centerIn: parent
                    text: "Python ↔ QML Signal-Slot 통신"
                    font.pixelSize: 24
                    font.bold: true
                    color: "white"
                }
            }
            
            // 섹션 1: Slot 바로 호출 (입력 없음)
            GroupBox {
                Layout.fillWidth: true
                Layout.margins: 10
                title: "1. Slot 바로 호출 - 입력 없음, 출력 있음"
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 10
                    
                    Text {
                        Layout.fillWidth: true
                        text: "• QML에서 Python의 Slot을 직접 호출하고 반환값을 받습니다"
                        wrapMode: Text.WordWrap
                    }
                    
                    Button {
                        Layout.alignment: Qt.AlignHCenter
                        text: "Slot 호출하기"
                        
                        onClicked: {
                            // Python Slot 직접 호출
                            var result = processor.getSimpleMessage()
                            resultLabel1.text = result
                            console.log("[QML] getSimpleMessage() 결과:", result)
                        }
                    }
                    
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        color: "#E8EAF6"
                        radius: 5
                        
                        Text {
                            id: resultLabel1
                            anchors.centerIn: parent
                            anchors.margins: 10
                            text: "여기에 결과가 표시됩니다"
                            wrapMode: Text.WordWrap
                        }
                    }
                }
            }
            
            // 섹션 2: Slot 바로 호출 (입력 있음)
            GroupBox {
                Layout.fillWidth: true
                Layout.margins: 10
                title: "2. Slot 바로 호출 - 입력 있음, 출력 있음"
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 10
                    
                    Text {
                        Layout.fillWidth: true
                        text: "• 입력값을 전달하고 처리된 결과를 즉시 받습니다"
                        wrapMode: Text.WordWrap
                    }
                    
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 10
                        
                        TextField {
                            id: textInput
                            Layout.fillWidth: true
                            placeholderText: "텍스트를 입력하세요"
                        }
                        
                        Button {
                            text: "처리하기"
                            
                            onClicked: {
                                // 입력값을 Slot에 전달하고 결과 받기
                                var result = processor.processText(textInput.text)
                                resultLabel2.text = result
                                console.log("[QML] processText 결과:", result)
                            }
                        }
                    }
                    
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        color: "#E8F5E9"
                        radius: 5
                        
                        Text {
                            id: resultLabel2
                            anchors.centerIn: parent
                            anchors.margins: 10
                            text: "처리 결과가 표시됩니다"
                            wrapMode: Text.WordWrap
                        }
                    }
                }
            }
            
            // 섹션 3: 계산 예제 (여러 입력)
            GroupBox {
                Layout.fillWidth: true
                Layout.margins: 10
                title: "3. Slot 바로 호출 - 여러 입력, 계산 결과"
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 10
                    
                    Text {
                        Layout.fillWidth: true
                        text: "• 여러 파라미터를 전달하고 계산 결과를 받습니다"
                        wrapMode: Text.WordWrap
                    }
                    
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 10
                        
                        SpinBox {
                            id: number1
                            from: 0
                            to: 100
                            value: 10
                        }
                        
                        Text {
                            text: "+"
                            font.pixelSize: 20
                        }
                        
                        SpinBox {
                            id: number2
                            from: 0
                            to: 100
                            value: 20
                        }
                        
                        Button {
                            text: "계산"
                            
                            onClicked: {
                                // 두 개의 숫자를 Slot에 전달
                                var result = processor.calculate(number1.value, number2.value)
                                calcResult.text = number1.value + " + " + number2.value + " = " + result
                            }
                        }
                    }
                    
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        color: "#FFF3E0"
                        radius: 5
                        
                        Text {
                            id: calcResult
                            anchors.centerIn: parent
                            text: "계산 결과가 표시됩니다"
                            font.pixelSize: 16
                            font.bold: true
                        }
                    }
                }
            }
            
            // 섹션 4: Signal을 이용한 비동기 처리
            GroupBox {
                Layout.fillWidth: true
                Layout.margins: 10
                title: "4. Signal을 이용한 Slot 호출 (비동기 패턴)"
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 10
                    
                    Text {
                        Layout.fillWidth: true
                        text: "• Slot을 호출하면 Python이 처리 후 Signal로 결과를 전달합니다\n• Connections 블록으로 Signal을 수신합니다"
                        wrapMode: Text.WordWrap
                    }
                    
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 10
                        
                        TextField {
                            id: asyncInput
                            Layout.fillWidth: true
                            placeholderText: "비동기 처리할 데이터 입력"
                        }
                        
                        Button {
                            text: "비동기 처리"
                            
                            onClicked: {
                                asyncResultLabel.text = "처리 중..."
                                asyncResultLabel.color = "#FF9800"
                                // Slot 호출 (반환값 없음)
                                processor.processDataAsync(asyncInput.text)
                            }
                        }
                    }
                    
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        color: "#E1F5FE"
                        radius: 5
                        
                        Text {
                            id: asyncResultLabel
                            anchors.centerIn: parent
                            anchors.margins: 10
                            text: "Signal로 받은 결과가 표시됩니다"
                            wrapMode: Text.WordWrap
                            font.bold: true
                        }
                    }
                }
            }
        }
    }
}
