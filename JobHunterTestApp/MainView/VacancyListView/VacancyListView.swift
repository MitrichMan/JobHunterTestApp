//
//  VacancyListView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 24.03.2024.
//

import SwiftUI

struct VacancyListView: View {
    @EnvironmentObject private var coordinator: Coordinator
    var vacancies: [Vacancy]
    @State var text = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    HStack {
                        TextField("Placeholder", text: $text)
                            .frame(height: 35)
                            .background(.gray)
                            .cornerRadius(8)
                        Button {} label: {
                            HStack {
                                ZStack {
                                    Image(.searchDefault)
                                }
                            }
                        }
                        .frame(width: 35, height: 35)
                        .background(.gray)
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    HStack {
                        Text("145 вакансий")
                            .font(.system(size: 18))
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Text("По соответствию")
                            .font(.system(size: 18))
                            .foregroundStyle(.blue)
                        
                        Image(.searchDefault)
                            .resizable()
                            .frame(width: 18, height: 18)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    ForEach(0...vacancies.count - 1, id: \.self) { index in
                        VacancyListCellView(vacancy: vacancies[index])
                            .onTapGesture(perform: {
                                coordinator.push(.vacancy)
                            })
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
            }
        }
    }
}

#Preview {
    VacancyListView(vacancies:
                        [
                            Vacancy(
                                id: "cbf0c984-7c6c-4ada-82da-e29dc698bb50",
                                lookingNumber: 2,
                                title: "UI/UX дизайнер",
                                address: Address(
                                    town: "Минск",
                                    street: "улица Бирюзова",
                                    house: "4/5"
                                ),
                                company: "Мобирикс",
                                experience: Experience(
                                    previewText: "Опыт от 1 до 3 лет",
                                    text: "1–3 года"
                                ),
                                publishedDate: "2024-02-20",
                                isFavorite: false,
                                salary: Salary(
                                    full: "Уровень дохода не указан",
                                    short: nil
                                ),
                                schedules: [
                                    "полная занятость",
                                    "полный день"
                                ],
                                appliedNumber: 147,
                                description: "Мы ищем специалиста на позицию UX/UI Designer, который вместе с коллегами будет заниматься проектированием пользовательских интерфейсов внутренних и внешних продуктов компании.",
                                responsibilities: "- проектирование пользовательских сценариев и создание прототипов;\n- разработка интерфейсов для продуктов компании (Web+App);\n- работа над созданием и улучшением Дизайн-системы;\n- взаимодействие с командами frontend-разработки;\n- контроль качества внедрения дизайна;\n- ситуативно: создание презентаций и других материалов на основе фирменного стиля компании",
                                questions: [
                                    "Где располагается место работы?",
                                    "Какой график работы?",
                                    "Вакансия открыта?",
                                    "Какая оплата труда?"
                                ]
                            ),
                            Vacancy(
                                id: "54a876a5-2205-48ba-9498-cfecff4baa6e",
                                lookingNumber: 17,
                                title: "UI/UX-дизайнер / Web-дизайнер / Дизайнер интерфейсов",
                                address: Address(
                                    town: "Казань",
                                    street: "улица Чистопольская",
                                    house: "20/10"
                                ),
                                company: "Шафигуллин Шакир",
                                experience: Experience(
                                    previewText: "Опыт от 1 до 3 лет",
                                    text: "1–3 года"
                                ),
                                publishedDate: "2024-03-06",
                                isFavorite: false,
                                salary: Salary(
                                    full: "20 000 до 50 000 ₽",
                                    short: "от 20 000 до 50 000 ₽ на руки"
                                ),
                                schedules: [
                                    "частичная занятость",
                                    "полный день"
                                ],
                                appliedNumber: nil,
                                description: "Мы разрабатываем мобильные приложения, web-приложения и сайты под ключ.\n\nНам в команду нужен UX/UI Designer!",
                                responsibilities: "- Разработка дизайна Web+App (обязательно Figma)\n\n- Работа над созданием и улучшением систем;\n\n- Взаимодействие с командами frontend-разработки и backend-разработки",
                                questions: [
                                    "Где располагается место работы?",
                                    "Какой график работы?",
                                    "Как с вами связаться?"
                                ]
                            ),
                            Vacancy(
                                id: "75c84407-52e1-4cce-a73a-ff2d3ac031b3",
                                lookingNumber: nil,
                                title: "UX/UI Designer",
                                address: Address(
                                    town: "Казань",
                                    street: "улица Пушкина",
                                    house: "2"
                                ),
                                company: "Aston",
                                experience: Experience(
                                    previewText: "Опыт от 3 до 6 лет",
                                    text: "3–6 лет"
                                ),
                                publishedDate: "2024-02-28",
                                isFavorite: true,
                                salary: Salary(
                                    full: "Уровень дохода не указан",
                                    short: nil
                                ),
                                schedules: [
                                    "полная занятость",
                                    "удаленная работа"
                                    
                                ],
                                appliedNumber: 11,
                                description: "Мы – аутсорсинговая аккредитованная IT-компания Aston, разрабатываем программное обеспечение на заказ и оказываем услуги IT-аутсорсинга предприятиям, организациям и стартапам. Приоритетные направления – финансовые технологии, телеком, ритейл, недвижимость и другие. Среди наших клиентов – компании Тинькофф, Х5 Retail Group, Банки.ру, ВТБ Банк, Альфа Банк, Цифра и другие.\n\nЗаказчик входит в топ-10 российских банков по величине активов, кредитного портфеля, размеру средств, привлеченных от клиентов, и нормативного капитала.\n\nБанк активно развивает онлайн-сервисы и работает по стратегии Mobile first. В компании есть отдельное подразделение, в котором создаются digital-продукты и внедряются цифровые технологии.",
                                responsibilities: "- совместно с Product Owner определять бизнес-метрики, потребности клиентов банка, фиксировать их в формате задач и метрик успешности;\n- изучать лучшие практики и недостатки аналогичных продуктов, проходить путь клиента и формулировать гипотезы решения задач вместе с продуктовой командой;\n- создавать прототипы для проверки гипотез;\n- передавать прототипы на Usability-тесты и контролировать их проведение;\n- улучшать решения по результатам тестов и наблюдений;\n- готовить чистовые макеты на основе компонентов дизайн-системы банка для передачи в разработку;\n- создавать и описывать новые компоненты дизайн-системы по принятым в банке стандартам;\n- отдавать на дизайн-чек макеты и проверять решения других дизайнеров;\n- передавать макеты разработчикам и отвечать на возникающие в процессе разработки вопросы;\n- проводить дизайн-ревью результата разработки и формулировать список замечаний для разработчиков;\n- итеративно совершенствовать дизайн цифрового продукта на основе метрик и отзывов клиентов;\n- участвовать в улучшении процессов центра компетенций продуктового дизайна.",
                                questions: [
                                    "Где располагается место работы?",
                                    "Какой график работы?",
                                    "Какая оплата труда?"
                                ]
                            )
                        ]
    )
}
