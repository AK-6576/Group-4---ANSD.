//
//  SummaryViewController.swift
//  ANSD_APP
//
//  Created by Anshul Kumaria on 25/11/25.
//

import UIKit
import PDFKit

class SummaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NotesCardCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var optionsButton: UIBarButtonItem!
    
    var conversationTitle = "Session"
    
    var participantsData: [ParticipantData] = [
        ParticipantData(
            name: "Peter Parker",
            initials: "PP",
            summary: "Peter has finished his assignment and is informing his friends about the same. He has a family outing at 4 PM and cannot help."
        ),
        ParticipantData(
            name: "Bruce Banner",
            initials: "BB",
            summary: "Bruce isn’t having fun for he hasn’t started doing it as well. He is panicking about the whole thing."
        ),
        ParticipantData(
            name: "Me",
            initials: "ME",
            summary: "Steve is being smug about the whole thing and is scolding his friends for not having done the assignment in the past 3 weeks."
        )
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        setupOptionsMenu()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Actions
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Menu Logic
    func setupOptionsMenu() {
        
        let shareAction = UIAction(title: "Share / Export", image: UIImage(systemName: "square.and.arrow.up")) { [weak self] _ in
            self?.showExportPopup()
        }
        
        let endAction = UIAction(title: "End Session", image: UIImage(systemName: "xmark.circle"), attributes: .destructive) { [weak self] _ in
            guard let self = self else { return }
            
            if let navController = self.view.window?.rootViewController as? UINavigationController {
                navController.popToRootViewController(animated: false)
                navController.dismiss(animated: true, completion: nil)
            }
        }
        
        let menu = UIMenu(title: "", children: [shareAction, endAction])
        optionsButton.menu = menu
    }
    
    // MARK: - Export Logic
    func showExportPopup() {
        let alert = UIAlertController(title: "Export Summary", message: "Choose a format to share", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Share as Text", style: .default, handler: { _ in self.shareAsText() }))
        alert.addAction(UIAlertAction(title: "Share as PDF", style: .default, handler: { _ in self.shareAsPDF() }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: true)
    }
    
    func shareAsText() {
        var fullText = "Conversation Title: \(conversationTitle)\n\n"
        for person in participantsData {
            fullText += "\(person.name) (\(person.initials)):\n\(person.summary)\n\n"
        }
        let activityVC = UIActivityViewController(activityItems: [fullText], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true)
    }
    
    func shareAsPDF() {
        var pdfContent = "Conversation Title: \(conversationTitle)\n\n"
        for person in participantsData {
            pdfContent += "\(person.name) (\(person.initials)):\n\(person.summary)\n\n"
        }
        if let pdfURL = createPDF(from: pdfContent) {
            let activityVC = UIActivityViewController(activityItems: [pdfURL], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true)
        }
    }
    
    func createPDF(from text: String) -> URL? {
        let pageWidth = 595.2; let pageHeight = 841.8
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect)
        
        let data = renderer.pdfData { (context) in
            context.beginPage()
            let attributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                NSAttributedString.Key.paragraphStyle: NSMutableParagraphStyle()
            ]
            let textRect = CGRect(x: 40, y: 40, width: pageWidth - 80, height: pageHeight - 80)
            text.draw(in: textRect, withAttributes: attributes)
        }
        
        let tempFolder = FileManager.default.temporaryDirectory
        let fileName = "\(conversationTitle) - Summary.pdf"
        let fileURL = tempFolder.appendingPathComponent(fileName)
        
        do { try data.write(to: fileURL); return fileURL } catch { return nil }
    }
    
    // MARK: - Table View Data Source
    func numberOfSections(in tableView: UITableView) -> Int { return 6 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 { return participantsData.count }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummarySectionHeaderCell", for: indexPath) as! SummarySectionHeaderCell
            cell.headerLabel.text = "Conversation Summary"
            cell.headerIcon.image = UIImage(systemName: "list.bullet.clipboard")
            return cell
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCardCell", for: indexPath) as! SummaryCardCell
            
            cell.titleLabel.text = conversationTitle
            
            return cell
            
        case 2:
            return tableView.dequeueReusableCell(withIdentifier: "ParticipantsSummaryHeaderCell", for: indexPath)
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParticipantsCardCell", for: indexPath) as! ParticipantCardCell
            cell.configure(with: participantsData[indexPath.row])
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummarySectionHeaderCell", for: indexPath) as! SummarySectionHeaderCell
            cell.headerLabel.text = "Notes"
            cell.headerIcon.image = UIImage(systemName: "note.text")
            return cell
            
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCardCell", for: indexPath) as! NotesCardCell
            cell.delegate = self
            return cell
            
        default: return UITableViewCell()
        }
    }
    
    // MARK: - Notes Delegate
    func didUpdateText(in cell: NotesCardCell) {
        tableView.performBatchUpdates(nil, completion: nil)
        if let indexPath = tableView.indexPath(for: cell) {
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
}
