package org.skyluc.slave1

import org.eclipse.jface.action.IAction
import org.eclipse.jface.dialogs.MessageDialog
import org.eclipse.jface.viewers.ISelection
import org.eclipse.ui.IWorkbenchWindow

import org.eclipse.ui.IWorkbenchWindowActionDelegate

class SampleAction extends IWorkbenchWindowActionDelegate {

  private var window: IWorkbenchWindow = _

  def dispose() {
  }

  def init(w: IWorkbenchWindow) {
    window = w
  }

  def run(action: IAction) {
    MessageDialog.openInformation(
      window.getShell(),
      "TestPDE",
      "Provided by %s %s".format(PluginBundle.default.id, PluginBundle.default.version))
  }

  def selectionChanged(action: IAction, selection: ISelection) {
  }

}
