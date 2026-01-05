"""
QML을 사용하여 선언적 UI를 구성하는 예제
"""

import os
import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject, Slot


class Backend(QObject):
    """QML과 연동되는 백엔드 클래스"""

    def __init__(self):
        super().__init__()
        self.click_count = 0

    @Slot(result=str)
    def getGreeting(self):
        """QML에서 호출할 수 있는 메서드"""
        self.click_count += 1
        return f"버튼이 {self.click_count}번 클릭되었습니다!"


def main():
    """메인 함수"""
    # QGuiApplication 인스턴스 생성
    app = QGuiApplication(sys.argv)

    # QML 엔진 생성
    engine = QQmlApplicationEngine()

    # 백엔드 객체 생성 및 QML에 등록
    backend = Backend()
    engine.rootContext().setContextProperty("backend", backend)

    # QML 파일 경로 설정
    qml_file = os.path.join(os.path.dirname(__file__), "main.qml")
    engine.load(qml_file)

    # QML 파일 로드 실패 확인
    if not engine.rootObjects():
        print("QML 파일을 로드하지 못했습니다.")
        sys.exit(-1)

    # 이벤트 루프 시작
    sys.exit(app.exec())


if __name__ == "__main__":
    main()
