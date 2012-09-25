package org.skyluc.slave2

import org.eclipse.ui.plugin.AbstractUIPlugin
import org.osgi.framework.BundleContext

object PluginBundle {

  private var _default: PluginBundle = _

  def default = _default

}

class PluginBundle extends AbstractUIPlugin {

  override def start(context: BundleContext) {
    super.start(context)
    PluginBundle._default = this
  }
  
  def id = getBundle().getSymbolicName()
  
  def version = getBundle().getVersion().toString()

}