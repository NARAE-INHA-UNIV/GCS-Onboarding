"""
간단한 GUI 윈도우를 생성하는 기본 예제
"""

import sys
from PySide6.QtWidgets import QApplication, QMainWindow, QLabel, QPushButton, QVBoxLayout, QWidget
from PySide6.QtCore import Qt


class HelloWorldWindow(QMainWindow):
    """메인 윈도우 클래스"""

    def __init__(self):
        super().__init__()
        self.init_ui()

    def init_ui(self):
        """UI 초기화"""
        # 윈도우 설정
        self.setWindowTitle("Hello World - PySide6")
        self.setGeometry(100, 100, 400, 300)

        # 중앙 위젯 생성
        central_widget = QWidget()
        self.setCentralWidget(central_widget)

        # 레이아웃 생성
        layout = QVBoxLayout()

        # 라벨 추가
        label = QLabel("안녕하세요! PySide6 세계에 오신 것을 환영합니다!")
        label.setAlignment(Qt.AlignCenter)
        label.setStyleSheet("font-size: 16px; padding: 20px;")

        # 버튼 추가
        button = QPushButton("클릭해보세요!")
        button.setStyleSheet("font-size: 14px; padding: 10px;")
        button.clicked.connect(self.on_button_clicked)

        # 레이아웃에 위젯 추가
        layout.addWidget(label)
        layout.addWidget(button)

        # 레이아웃 설정
        central_widget.setLayout(layout)

    def on_button_clicked(self):
        """버튼 클릭 이벤트 핸들러"""
        print("버튼이 클릭되었습니다!")
        sender = self.sender()
        sender.setText("클릭됨!")


def main():
    """메인 함수"""
    # QApplication 인스턴스 생성
    app = QApplication(sys.argv)

    # 메인 윈도우 생성 및 표시
    window = HelloWorldWindow()
    window.show()

    # 이벤트 루프 시작
    sys.exit(app.exec())


if __name__ == "__main__":
    main()
