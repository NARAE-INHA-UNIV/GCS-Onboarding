"""
PySide6 QML Layout 예제
RowLayout, ColumnLayout을 사용하여 QML에서 레이아웃을 구성하는 방법을 학습하는 예제
"""

import os
import sys
from pathlib import Path
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine


def main():
    """메인 함수"""
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()

    # QML 파일 경로 설정
    qml_file = os.path.join(os.path.dirname(__file__), "main.qml")
    engine.load(qml_file)

    if not engine.rootObjects():
        print("QML 파일을 로드하지 못했습니다.")
        sys.exit(-1)

    sys.exit(app.exec())


if __name__ == "__main__":
    main()
