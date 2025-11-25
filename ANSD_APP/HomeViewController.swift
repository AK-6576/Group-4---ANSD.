//
//  HomeViewController.swift
//  ANSD_APP
//
//  Created by Daiwiik on 25/11/25.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - UI Components
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let mainStack = UIStackView()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Set the background color
        view.backgroundColor = .systemBackground
        
        // 2. Setup the scroll view and its content view
        setupScrollView()
        
        // 3. Assemble all the custom UI components
        setupUI()
    }

    // MARK: - Setup Methods
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        // Scroll View Constraints (Full Screen)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // Content View Constraints (Must define height and width relation to scrollView)
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // Important: Forces vertical scrolling
        ])
    }
    
    private func setupUI() {
        mainStack.axis = .vertical
        mainStack.spacing = 25 // Space between major sections
        mainStack.isLayoutMarginsRelativeArrangement = true
        // Overall screen padding for left/right
        mainStack.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        // Add all sections to the main stack
        mainStack.addArrangedSubview(createHeaderStack())
        mainStack.addArrangedSubview(createVoiceCommandView())
        mainStack.addArrangedSubview(createActionButtonsStack())

        // Routine Conversations Section
        mainStack.addArrangedSubview(createSectionHeader(title: "Routine Conversations"))
        mainStack.addArrangedSubview(createRoutineGrid())
        
        // View Conversations Section
        mainStack.addArrangedSubview(createSectionHeader(title: "View Conversations"))
        
        // Conversation List (Placeholders for scrollability)
        mainStack.addArrangedSubview(createConversationPlaceholder(title: "Conversation 1: This is a task from James related to Office..."))
        mainStack.addArrangedSubview(createConversationPlaceholder(title: "Conversation 2: Planning family trip for the holidays."))
        mainStack.addArrangedSubview(createConversationPlaceholder(title: "Conversation 3: Weekly budget review and savings goal."))
        mainStack.addArrangedSubview(createConversationPlaceholder(title: "Conversation 4: School pickup schedule for the week."))
        mainStack.addArrangedSubview(createConversationPlaceholder(title: "Conversation 5: Upcoming medical appointments."))


        // Add the main stack to the content view
        contentView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        // Constraints for the main stack
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    // MARK: - Component Creation

    /// Creates a generic header label for sections like "Routine" or "View Conversations".
    func createSectionHeader(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }

    /// Creates the "Hello, Steve" header with profile image.
    func createHeaderStack() -> UIStackView {
        let titleLabel = UILabel()
        titleLabel.text = "Hello, Steve"
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)

        let profileImageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        profileImageView.tintColor = .systemGray2
        profileImageView.contentMode = .scaleAspectFit
        
        // Constraints for the profile image size
        profileImageView.widthAnchor.constraint(equalToConstant: 45).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        profileImageView.layer.cornerRadius = 22.5
        profileImageView.clipsToBounds = true

        let stack = UIStackView(arrangedSubviews: [titleLabel, profileImageView])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center

        return stack
    }

    /// Creates the main voice command button area.
    func createVoiceCommandView() -> UIView {
        let container = UIView()
        // Use a light gray background color
        container.backgroundColor = .systemGray5
        container.layer.cornerRadius = 15
        
        // Microphone/Waveform Icon
        let micImage = UIImageView(image: UIImage(systemName: "mic.circle.fill"))
        micImage.tintColor = .systemBlue
        micImage.contentMode = .scaleAspectFit
        micImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = "Zaira - Optimised conversational AI"
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textAlignment = .center
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Tell me what you need assistance with"
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.textColor = .systemGray

        let stack = UIStackView(arrangedSubviews: [micImage, titleLabel, subtitleLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4

        container.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Center the stack inside the container
            stack.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            // Add padding (adjust the container height accordingly)
            container.heightAnchor.constraint(equalToConstant: 130),
            stack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10)
        ])

        return container
    }

    /// Creates the horizontal stack of 'New Conversation' and 'Join Conversation' buttons.
    func createActionButtonsStack() -> UIStackView {
        let newConversationButton = createCustomActionButton(title: "New Conversation", iconName: "plus.circle.fill")
        let joinConversationButton = createCustomActionButton(title: "Join Conversation", iconName: "person.2.fill")

        let stack = UIStackView(arrangedSubviews: [newConversationButton, joinConversationButton])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 15 // Space between the two buttons

        return stack
    }
    
    /// Helper to create a single action button with image above title.
    func createCustomActionButton(title: String, iconName: String) -> UIButton {
        var config = UIButton.Configuration.plain()
        config.title = title
        config.image = UIImage(systemName: iconName)
        config.imagePlacement = .top
        config.imagePadding = 8
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 24, weight: .medium)

        let button = UIButton(configuration: config, primaryAction: nil)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.tintColor = .label // Icon color adapts to light/dark mode
        
        // Set a fixed height
        button.heightAnchor.constraint(equalToConstant: 90).isActive = true

        return button
    }

    /// Creates the 2x4 grid of routine icons.
    func createRoutineGrid() -> UIStackView {
        // Data for the routines (iconName, title)
        let routines = [
            ("briefcase.fill", "Office"), ("house.fill", "Family"),
            ("figure.walk.circle.fill", "Kids"), ("calendar", "Schedule"),
            ("airplane", "Travel"), ("fork.knife", "Food"),
            ("heart.fill", "Fitness"), ("dollarsign.circle.fill", "Finance")
        ]
        
        let row1 = UIStackView(arrangedSubviews: routines[0...3].map { createRoutineIcon(title: $0.1, iconName: $0.0) })
        let row2 = UIStackView(arrangedSubviews: routines[4...7].map { createRoutineIcon(title: $0.1, iconName: $0.0) })

        let configureRow: (UIStackView) -> Void = { row in
            row.axis = .horizontal
            row.distribution = .fillEqually
            row.spacing = 10
        }

        configureRow(row1)
        configureRow(row2)

        let mainStack = UIStackView(arrangedSubviews: [row1, row2])
        mainStack.axis = .vertical
        mainStack.spacing = 10

        return mainStack
    }

    /// Helper function for a single routine icon button.
    func createRoutineIcon(title: String, iconName: String) -> UIView {
        let icon = UIImageView(image: UIImage(systemName: iconName))
        icon.tintColor = .systemBlue
        icon.contentMode = .scaleAspectFit
        icon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 24).isActive = true

        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .center
        
        let containerStack = UIStackView(arrangedSubviews: [icon, label])
        containerStack.axis = .vertical
        containerStack.alignment = .center
        containerStack.spacing = 4
        
        let buttonContainer = UIView()
        buttonContainer.addSubview(containerStack)
        buttonContainer.backgroundColor = .systemGray6
        buttonContainer.layer.cornerRadius = 10
        
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Center the stack within the container for even padding
            containerStack.centerXAnchor.constraint(equalTo: buttonContainer.centerXAnchor),
            containerStack.centerYAnchor.constraint(equalTo: buttonContainer.centerYAnchor),
            // Ensure a minimum size/padding
            buttonContainer.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        return buttonContainer
    }
    
    /// Placeholder for a single conversation cell (for demonstration purposes).
    func createConversationPlaceholder(title: String) -> UIView {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        titleLabel.numberOfLines = 2
        
        let icon = UIImageView(image: UIImage(systemName: "chevron.right"))
        icon.tintColor = .systemGray

        let textStack = UIStackView(arrangedSubviews: [titleLabel])
        textStack.axis = .vertical
        
        let mainStack = UIStackView(arrangedSubviews: [textStack, icon])
        mainStack.axis = .horizontal
        mainStack.alignment = .center
        mainStack.spacing = 10
        
        let container = UIView()
        container.addSubview(mainStack)
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 10
        container.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Padding inside the cell
            mainStack.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            mainStack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            mainStack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 15),
            mainStack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15)
        ])
        return container
    }
}
