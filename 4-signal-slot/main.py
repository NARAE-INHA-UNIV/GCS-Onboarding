"""
Python과 QML 간의 Signal-Slot 통신 방법을 학습하는 예제
"""

import os
import sys
import time
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject, Slot, Signal


class DataProcessor(QObject):
    """Signal-Slot 데모를 위한 백엔드 클래스"""

    # Signal 정의
    dataProcessed = Signal(str)  # 처리 결과를 전달하는 시그널

    def __init__(self):
        super().__init__()

    # 1. Slot 바로 호출 - 입력 없음, 출력 있음
    @Slot(result=str)
    def getSimpleMessage(self):
        """간단한 메시지를 반환하는 Slot"""
        return "안녕하세요! 이것은 Slot을 직접 호출한 결과입니다."

    # 2. Slot 바로 호출 - 입력 있음, 출력 있음
    @Slot(str, result=str)
    def processText(self, text):
        """
        입력받은 텍스트를 처리하는 Slot
        Args:
            text: 처리할 텍스트
        Returns:
            처리된 결과 문자열
        """
        result = f"처리됨: '{text}' (길이: {len(text)}자)"
        print(f"[Python] processText 호출: {text}")
        return result

    # 3. Slot 바로 호출 - 여러 입력, 계산 결과 반환
    @Slot(int, int, result=int)
    def calculate(self, a, b):
        """
        두 숫자를 더하는 Slot
        Args:
            a: 첫 번째 숫자
            b: 두 번째 숫자
        Returns:
            합계
        """
        result = a + b
        print(f"[Python] calculate({a}, {b}) = {result}")
        return result

    # 4. Signal을 발생시키는 Slot - 비동기 처리 시뮬레이션
    @Slot(str)
    def processDataAsync(self, data):
        """
        데이터를 처리하고 Signal을 발생시키는 Slot
        Args:
            data: 처리할 데이터
        """
        print(f"[Python] 비동기 처리 시작: {data}")

        # 1초 대기 후 결과 반환
        time.sleep(1)

        # 처리 완료 시그널 발생
        result = f"처리 완료: {data.upper()}"
        self.dataProcessed.emit(result)
        print(f"[Python] 비동기 처리 완료")


def main():
    """메인 함수"""
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()

    # 백엔드 객체 생성 및 QML에 등록
    processor = DataProcessor()
    engine.rootContext().setContextProperty("processor", processor)

    # QML 파일 로드
    qml_file = os.path.join(os.path.dirname(__file__), "main.qml")
    engine.load(qml_file)

    if not engine.rootObjects():
        print("QML 파일을 로드하지 못했습니다.")
        sys.exit(-1)

    sys.exit(app.exec())


if __name__ == "__main__":
    main()
