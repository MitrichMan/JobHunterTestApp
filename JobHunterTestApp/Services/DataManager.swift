//
//  DataManager.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import Foundation
//import Combine

class DataManager: ObservableObject {
    @Published var emailIsValid = false
    @Published var isLoggedIn = false
    
    @Published var isDataFetched = false 
//    {
//        didSet {
//            print(isDataFetched)
////            objectWillChange.send()
//        }
//    }
    
    @Published var mainViewData = MainViewDataResponse(offers: [], vacancies: [])
    
//    @Published var navigationPaths = NavigationPaths(tab: NavigationPath(), page: NavigationPath())
    
    let tabBarTabs: [Tab] = [.mainViewCoordinator, .favourites([]), .responses, .messages, .profile]

    let mockMainViewDataResponse = MainViewDataResponse(
        offers: [
            Offer(
                id: "near_vacancies",
                title: "Вакансии рядом с вами",
                link: "https://hh.ru/",
                button: nil
            ),
            Offer(
                id: "level_up_resume",
                title: "Поднять резюме в поиске",
                link: "https://hh.ru/mentors?from=footer_new&hhtmFromLabel=footer_new&hhtmFrom=main&purposeId=1",
                button: OfferButton(text: "Поднять")
            ),
            Offer(
                id: "temporary_job",
                title: "Временная работа или подработка",
                link: "https://hh.ru/",
                button: nil
            ),
            Offer(
                id: nil,
                title: "Полезные статьи и советы",
                link: "https://hh.ru/articles?hhtmFrom=main",
                button: nil
            )
        ],
        vacancies: [
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
    
//    let objectWillChange = ObservableObjectPublisher()
            
    static let shared = DataManager()
    
    private init() {}
    
    func getStartPage() -> Page {
        return isLoggedIn && isDataFetched ? .main(mainViewData) : .signIn
    }
    
    @MainActor func fetchMainViewData() async {
        do {
           mainViewData = try await NetworkManager.shared.fetchMainViewDataResponse()
            isDataFetched = true
        } catch {
            print(error)
        }
    }
    
    @MainActor func fetchMockData() async {
        mainViewData = mockMainViewDataResponse
        
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        DispatchQueue.main.async {
            DataManager.shared.isDataFetched = true
        }
    }
}

enum Tab: Hashable {
    case mainViewCoordinator
    case favourites([Vacancy])
    case responses
    case messages
    case profile
}

enum Page: Hashable {
    case signIn
    case main(MainViewDataResponse)
    case vacancyList([Vacancy])
    case vacancy(Vacancy)
}

//"""
//{
// "offers": [
//   {
//     "id": "near_vacancies",
//     "title": "Вакансии рядом с вами",
//     "link": "https://hh.ru/"
//   },
//   {
//     "id": "level_up_resume",
//     "title": "Поднять резюме в поиске",
//     "button": {
//       "text": "Поднять"
//     },
//     "link": "https://hh.ru/mentors?from\u003dfooter_new\u0026hhtmFromLabel\u003dfooter_new\u0026hhtmFrom\u003dmain\u0026purposeId\u003d1"
//   },
//   {
//     "id": "temporary_job",
//     "title": "  Временная работа или подработка",
//     "link": "https://hh.ru/"
//   },
//   {
//     "title": "Полезные статьи и советы",
//     "link": "https://hh.ru/articles?hhtmFrom\u003dmain"
//   }
// ],
// "vacancies": [
//   {
//     "id": "cbf0c984-7c6c-4ada-82da-e29dc698bb50",
//     "lookingNumber": 2,
//     "title": "UI/UX дизайнер",
//     "address": {
//       "town": "Минск",
//       "street": "улица Бирюзова",
//       "house": "4/5"
//     },
//     "company": "Мобирикс",
//     "experience": {
//       "previewText": "Опыт от 1 до 3 лет",
//       "text": "1–3 года"
//     },
//     "publishedDate": "2024-02-20",
//     "isFavorite": false,
//     "salary": {
//       "full": "Уровень дохода не указан"
//     },
//     "schedules": [
//       "полная занятость",
//       "полный день"
//     ],
//     "appliedNumber": 147,
//     "description": "Мы ищем специалиста на позицию UX/UI Designer, который вместе с коллегами будет заниматься проектированием пользовательских интерфейсов внутренних и внешних продуктов компании.",
//     "responsibilities": "- проектирование пользовательских сценариев и создание прототипов;\n- разработка интерфейсов для продуктов компании (Web+App);\n- работа над созданием и улучшением Дизайн-системы;\n- взаимодействие с командами frontend-разработки;\n- контроль качества внедрения дизайна;\n- ситуативно: создание презентаций и других материалов на основе фирменного стиля компании",
//     "questions": [
//       "Где располагается место работы?",
//       "Какой график работы?",
//       "Вакансия открыта?",
//       "Какая оплата труда?"
//     ]
//   },
//   {
//     "id": "54a876a5-2205-48ba-9498-cfecff4baa6e",
//     "lookingNumber": 17,
//     "title": "UI/UX-дизайнер / Web-дизайнер / Дизайнер интерфейсов",
//     "address": {
//       "town": "Казань",
//       "street": "улица Чистопольская",
//       "house": "20/10"
//     },
//     "company": "Шафигуллин Шакир",
//     "experience": {
//       "previewText": "Опыт от 1 до 3 лет",
//       "text": "1–3 года"
//     },
//     "publishedDate": "2024-03-06",
//     "isFavorite": false,
//     "salary": {
//       "short": "20 000 до 50 000 ₽",
//       "full": "от 20 000 до 50 000 ₽ на руки"
//     },
//     "schedules": [
//       "частичная занятость",
//       "полный день"
//     ],
//     "description": "Мы разрабатываем мобильные приложения, web-приложения и сайты под ключ.\n\nНам в команду нужен UX/UI Designer!",
//     "responsibilities": "- Разработка дизайна Web+App (обязательно Figma)\n\n- Работа над созданием и улучшением систем;\n\n- Взаимодействие с командами frontend-разработки и backend-разработки",
//     "questions": [
//       "Где располагается место работы?",
//       "Какой график работы?",
//       "Как с вами связаться?"
//     ]
//   },
//   {
//     "id": "75c84407-52e1-4cce-a73a-ff2d3ac031b3",
//     "title": "UX/UI Designer",
//     "address": {
//       "town": "Казань",
//       "street": "улица Пушкина",
//       "house": "2"
//     },
//     "company": "Aston",
//     "experience": {
//       "previewText": "Опыт от 3 до 6 лет",
//       "text": "3–6 лет"
//     },
//     "publishedDate": "2024-02-28",
//     "isFavorite": true,
//     "salary": {
//       "full": "Уровень дохода не указан"
//     },
//     "schedules": [
//       "полная занятость",
//       "удаленная работа"
//     ],
//     "appliedNumber": 11,
//     "description": "Мы – аутсорсинговая аккредитованная IT-компания Aston, разрабатываем программное обеспечение на заказ и оказываем услуги IT-аутсорсинга предприятиям, организациям и стартапам. Приоритетные направления – финансовые технологии, телеком, ритейл, недвижимость и другие. Среди наших клиентов – компании Тинькофф, Х5 Retail Group, Банки.ру, ВТБ Банк, Альфа Банк, Цифра и другие.\n\nЗаказчик входит в топ-10 российских банков по величине активов, кредитного портфеля, размеру средств, привлеченных от клиентов, и нормативного капитала.\n\nБанк активно развивает онлайн-сервисы и работает по стратегии Mobile first. В компании есть отдельное подразделение, в котором создаются digital-продукты и внедряются цифровые технологии.",
//     "responsibilities": "- совместно с Product Owner определять бизнес-метрики, потребности клиентов банка, фиксировать их в формате задач и метрик успешности;\n- изучать лучшие практики и недостатки аналогичных продуктов, проходить путь клиента и формулировать гипотезы решения задач вместе с продуктовой командой;\n- создавать прототипы для проверки гипотез;\n- передавать прототипы на Usability-тесты и контролировать их проведение;\n- улучшать решения по результатам тестов и наблюдений;\n- готовить чистовые макеты на основе компонентов дизайн-системы банка для передачи в разработку;\n- создавать и описывать новые компоненты дизайн-системы по принятым в банке стандартам;\n- отдавать на дизайн-чек макеты и проверять решения других дизайнеров;\n- передавать макеты разработчикам и отвечать на возникающие в процессе разработки вопросы;\n- проводить дизайн-ревью результата разработки и формулировать список замечаний для разработчиков;\n- итеративно совершенствовать дизайн цифрового продукта на основе метрик и отзывов клиентов;\n- участвовать в улучшении процессов центра компетенций продуктового дизайна.",
//     "questions": [
//       "Где располагается место работы?",
//       "Какой график работы?",
//       "Какая оплата труда?"
//     ]
//   },
//   {
//     "id": "16f88865-ae74-4b7c-9d85-b68334bb97db",
//     "lookingNumber": 57,
//     "title": "Веб-дизайнер",
//     "address": {
//       "town": "Казань",
//       "street": "улица Пушкина",
//       "house": "57"
//     },
//     "company": "Алабуга. Маркетинг и PR",
//     "experience": {
//       "previewText": "Без опыта",
//       "text": "не требуется"
//     },
//     "publishedDate": "2024-03-02",
//     "isFavorite": false,
//     "salary": {
//       "short": "от 60 000 ₽",
//       "full": "от 60 000 ₽ до вычета налогов"
//     },
//     "schedules": [
//       "частичная занятость",
//       "полный день"
//     ],
//     "appliedNumber": 7,
//     "responsibilities": "- Разработка новых сайтов, приложений, лэндингов;\n- Создание и доработка прототипов готовых к сдаче в верстку;\n- Взаимодействие с подрядчиками по разработке сайтов\n- Доработка существующих сайтов;\n- Проектирование интерфейсов, организация UI/UX-исследований;\n- Взаимодействие с Frontend и Backend разработчиками, техническими специалистами;\n- Работа с дизайн системой, её поддержание.",
//     "questions": [
//       "Где располагается место работы?",
//       "Какой график работы?",
//       "Вакансия открыта?",
//       "Какая оплата труда?"
//     ]
//   },
//   {
//     "id": "26f88856-ae74-4b7c-9d85-b68334bb97db",
//     "lookingNumber": 29,
//     "title": "Ведущий продуктовый дизайнер",
//     "address": {
//       "town": "Минск",
//       "street": "проспект Хасанова",
//       "house": "15"
//     },
//     "company": "ПАО Ростелеком",
//     "experience": {
//       "previewText": "Опыт от 3 до 6 лет",
//       "text": "3–6 лет"
//     },
//     "publishedDate": "2024-02-19",
//     "isFavorite": false,
//     "salary": {
//       "full": "Уровень дохода не указан"
//     },
//     "schedules": [
//       "полная занятость",
//       "удаленная работа"
//     ],
//     "description": "Перед вами не просто вакансия. Перед вами — уникальные возможности, от которых вас отделяет всего один клик.",
//     "responsibilities": "— Готовить макеты на основании прототипа и/или описания пользовательских сценариев;\n— Анализировать бизнесовые и пользовательские требования, уточнять постановки от аналитиков и проектировщиков;\n— Создавать графические и стилистические элементы для портала, приложений и промо страниц;\n— Оптимизировать дизайн существующих интерфейсов;\n— Осуществлять авторский контроль над исполнителями;\n— Развивать существующую дизайн-систему и UI-киты;\n— Помогать в подготовке продающих фичи презентаций.",
//     "questions": [
//       "Где располагается место работы?",
//       "Какой график работы?",
//       "Вакансия открыта?",
//       "Какая оплата труда?"
//     ]
//   },
//   {
//     "id": "15f88865-ae74-4b7c-9d81-b78334bb97db",
//     "lookingNumber": 1,
//     "title": "Product Designer",
//     "address": {
//       "town": "Минск",
//       "street": "улица Побратимова",
//       "house": "5"
//     },
//     "company": "TravelLine",
//     "experience": {
//       "previewText": "Опыт от 3 до 6 лет",
//       "text": "3–6 лет"
//     },
//     "publishedDate": "2024-02-02",
//     "isFavorite": false,
//     "salary": {
//       "full": "Уровень дохода не указан"
//     },
//     "schedules": [
//       "полная занятость",
//       "полный день"
//     ],
//     "appliedNumber": 1,
//     "description": "В TravelLine мы разрабатываем единую функциональную Платформу для автоматизации процессов гостиничного бизнеса. Всё, что связано с онлайн-бронированием и управлением номерным фондом в отелях — это к нам. Ежемесячно через наши системы бронируют более 1,5 миллионов гостей.\n\nМы ищем коллегу в команду продуктовых дизайнеров на В2В продукт.\nСейчас в нашей команде 10 продуктовых дизайнеров, которые занимаются В2В, В2С и В2Е продуктами.\nВ начале пути у тебя будет наставник, который поможет в адаптации к новой команде.",
//     "responsibilities": "- Проектировать интерфейс B2B продукта: сопровождать и улучшать текущие решения, поддерживать консистентность\n\n- Понимать потребности и боли пользователей, логику взаимодействия пользователя с продуктом, участвовать в этапе discovery\n\n- Создавать интерактивные прототипы\n\n- Проводить юзабилити-тестирования и ревью реализации решений\n\n- Работать внутри продуктовой команды: коммуницировать с дизайнерами, продакт и проджект менеджерами, аналитиками, разработчиками и тестировщиками.",
//     "questions": [
//       "Где располагается место работы?",
//       "Какой график работы?",
//       "Вакансия открыта?",
//       "Какая оплата труда?",
//       "Как с вами связаться?"
//     ]
//   }
// ]
//}
//"""

