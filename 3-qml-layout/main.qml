import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 900
    height: 700
    visible: true
    title: "QML Layout 학습 - RowLayout vs ColumnLayout, Layout vs anchors"
    
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
                color: "#2196F3"
                
                Text {
                    anchors.centerIn: parent  // anchors 사용 (부모 기준)
                    text: "QML Layout 시스템 학습"
                    font.pixelSize: 24
                    font.bold: true
                    color: "white"
                }
            }
            
            // 섹션 1: ColumnLayout
            GroupBox {  
                Layout.fillWidth: true
                Layout.margins: 10
                title: "1. ColumnLayout - 수직 배치"
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 10
                    
                    Text {
                        Layout.fillWidth: true  // Layout.* 사용 (레이아웃 내부)
                        text: "• ColumnLayout은 자식 요소들을 수직으로 배치합니다"
                        wrapMode: Text.WordWrap
                    }
                    
                    Rectangle {
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 40
                        Layout.alignment: Qt.AlignHCenter  // 레이아웃 내 중앙 정렬
                        color: "#FF5722"
                        Text {
                            anchors.centerIn: parent  // 부모(Rectangle) 내 중앙 정렬
                            text: "첫 번째 아이템"
                            color: "white"
                        }
                    }
                    
                    Rectangle {
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 40
                        Layout.alignment: Qt.AlignHCenter
                        color: "#FF7043"
                        Text {
                            anchors.centerIn: parent
                            text: "두 번째 아이템"
                            color: "white"
                        }
                    }
                    
                    Rectangle {
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 40
                        Layout.alignment: Qt.AlignHCenter
                        color: "#FF8A65"
                        Text {
                            anchors.centerIn: parent
                            text: "세 번째 아이템"
                            color: "white"
                        }
                    }
                }
            }
            
            // 섹션 2: RowLayout
            GroupBox {
                Layout.fillWidth: true
                Layout.margins: 10
                title: "2. RowLayout - 수평 배치"
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 10
                    
                    Text {
                        Layout.fillWidth: true
                        text: "• RowLayout은 자식 요소들을 수평으로 배치합니다"
                        wrapMode: Text.WordWrap
                    }
                    
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 10
                        
                        Rectangle {
                            Layout.preferredWidth: 100
                            Layout.preferredHeight: 60
                            color: "#4CAF50"
                            Text {
                                anchors.centerIn: parent
                                text: "아이템 1"
                                color: "white"
                            }
                        }
                        
                        Rectangle {
                            Layout.preferredWidth: 100
                            Layout.preferredHeight: 60
                            color: "#66BB6A"
                            Text {
                                anchors.centerIn: parent
                                text: "아이템 2"
                                color: "white"
                            }
                        }
                        
                        Rectangle {
                            Layout.preferredWidth: 100
                            Layout.preferredHeight: 60
                            color: "#81C784"
                            Text {
                                anchors.centerIn: parent
                                text: "아이템 3"
                                color: "white"
                            }
                        }
                    }
                }
            }
            
            // 섹션 3: Layout.* 속성
            GroupBox {
                Layout.fillWidth: true
                Layout.margins: 10
                title: "3. Layout.* 속성 - 레이아웃 내부에서 사용"
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 10
                    
                    Text {
                        Layout.fillWidth: true
                        text: "• Layout.* 속성은 레이아웃(Row/Column/Grid) 내부에서만 동작\n• 레이아웃이 자식의 위치와 크기를 자동으로 관리"
                        wrapMode: Text.WordWrap
                    }
                    
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 10
                        
                        Rectangle {
                            Layout.fillWidth: true  // 남은 공간 모두 차지
                            Layout.preferredHeight: 50
                            color: "#9C27B0"
                            Text {
                                anchors.centerIn: parent
                                text: "Layout.fillWidth: true"
                                color: "white"
                            }
                        }
                        
                        Rectangle {
                            Layout.preferredWidth: 150  // 고정 너비
                            Layout.preferredHeight: 50
                            color: "#BA68C8"
                            Text {
                                anchors.centerIn: parent
                                text: "고정 너비: 150"
                                color: "white"
                            }
                        }
                    }
                    
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 5
                        
                        Rectangle {
                            Layout.alignment: Qt.AlignLeft  // 왼쪽 정렬
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 40
                            color: "#E91E63"
                            Text {
                                anchors.centerIn: parent
                                text: "AlignLeft"
                                color: "white"
                            }
                        }
                        
                        Rectangle {
                            Layout.alignment: Qt.AlignHCenter  // 중앙 정렬
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 40
                            color: "#F06292"
                            Text {
                                anchors.centerIn: parent
                                text: "AlignHCenter"
                                color: "white"
                            }
                        }
                        
                        Rectangle {
                            Layout.alignment: Qt.AlignRight  // 오른쪽 정렬
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 40
                            color: "#F48FB1"
                            Text {
                                anchors.centerIn: parent
                                text: "AlignRight"
                                color: "white"
                            }
                        }
                    }
                }
            }
            
            // 섹션 4: anchors 속성
            GroupBox {
                Layout.fillWidth: true
                Layout.margins: 10
                title: "4. anchors 속성 - 레이아웃 외부에서 사용"
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 10
                    
                    Text {
                        Layout.fillWidth: true
                        text: "• anchors는 부모나 형제 요소를 기준으로 위치 지정\n• 레이아웃 없이 절대/상대 위치 지정 가능"
                        wrapMode: Text.WordWrap
                    }
                    
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        color: "#E0E0E0"
                        border.color: "#9E9E9E"
                        border.width: 2
                        
                        // anchors.top 사용
                        Rectangle {
                            id: topRect
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 10
                            width: 120
                            height: 40
                            color: "#FF9800"
                            Text {
                                anchors.centerIn: parent
                                text: "anchors.top"
                                color: "white"
                            }
                        }
                        
                        // anchors.centerIn 사용
                        Rectangle {
                            anchors.centerIn: parent
                            width: 120
                            height: 40
                            color: "#FFA726"
                            Text {
                                anchors.centerIn: parent
                                text: "centerIn"
                                color: "white"
                            }
                        }
                        
                        // anchors.bottom 사용
                        Rectangle {
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 10
                            width: 120
                            height: 40
                            color: "#FFB74D"
                            Text {
                                anchors.centerIn: parent
                                text: "anchors.bottom"
                                color: "white"
                            }
                        }
                        
                        // anchors.left 사용
                        Rectangle {
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.margins: 10
                            width: 80
                            height: 40
                            color: "#FFCC80"
                            Text {
                                anchors.centerIn: parent
                                text: "left"
                                color: "white"
                                font.pixelSize: 12
                            }
                        }
                        
                        // anchors.right 사용
                        Rectangle {
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.margins: 10
                            width: 80
                            height: 40
                            color: "#FFCC80"
                            Text {
                                anchors.centerIn: parent
                                text: "right"
                                color: "white"
                                font.pixelSize: 12
                            }
                        }
                    }
                }
            }
        }
    }
}
