//
//  VacancyListView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 24.03.2024.
//

import SwiftUI

struct VacancyListView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    @State var searchPromptText = ""
    
    var vacancies: [Vacancy]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    HStack {
                        ZStack {
                            Color(.gray2)
                                .frame(height: 40)
                                .cornerRadius(8)
                                .shadow(color: .shadow, radius: 2, y:4)
                            HStack {
                                Button {
                                    coordinator.pop()
                                } label: {
                                    Image(.leftArrowDefault)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(.gray4)
                                }
                                
                                if searchPromptText.count  < 1 {
                                    Text("Должность, ключевые слова")
                                        .font(.system(size: 14))
                                        .foregroundStyle(.gray4)
                                }
                                
                                Spacer()
                                
                            }
                            .frame(height: 40)
                            .padding(.horizontal, 8)
                            
                            HStack {
                                Spacer(minLength: 32)
                                TextField("", text: $searchPromptText)
                                    .frame(height: 40)
                                    .foregroundStyle(.white)
                            }
                            .padding(.horizontal, 8)
                            .shadow(color: .shadow, radius: 2, y:4)
                        }
                        
                        ZStack {
                            Color(.gray2)
                                .frame(width: 40, height: 40)
                                .cornerRadius(8)
                            
                            Button {} label: {
                                Image(.filterDefault)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.white)
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                    
                    HStack {
                        Text("145 вакансий")
                            .font(.system(size: 14))
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Text("По соответствию")
                            .font(.system(size: 14))
                            .foregroundStyle(.blue1)
                        
                        Image(.sortingDefault)
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.blue1)
                    }
                    .padding(.horizontal)
                    
                    ForEach(vacancies, id: \.self) { vacancy in
                        VacancyListCellView(vacancy: vacancy)
                            .onTapGesture(perform: {
                                coordinator.push(.vacancy(vacancy))
                            })
                    }
                    .padding(.horizontal)
                }
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {} label: {
                        ZStack {
                            Capsule()
                                .frame(width: 99, height: 48)
                                .foregroundColor(.gray2)
                            
                            HStack {
                                Image(.mapDefault)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                
                                Text("Карта")
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .foregroundColor(.white)
                        }
                    }
                    .padding(.vertical, 24)
                }
            }
            .padding(.horizontal)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    VacancyListView(vacancies: [
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
    ])
}
